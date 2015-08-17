<?php
/**
 * @file capkopper_multilingual.profile
 */

/**
 * Implements hook_install_tasks().
 *
 * Note, these tasks run after the "Configure site" step (where the admin
 * password is set).
 */
function capkopper_multilingual_install_tasks($install_state) {
  // Attempt to increase memory limit to 196M.
  if (ini_get('memory_limit') != '-1' && ini_get('memory_limit') <= '196M' && ini_get('memory_limit') >= '128M') {
    ini_set('memory_limit', '196M');
  }

  // Increase maximum function nesting level to prevent install errors.
  $max_nesting_level = ini_get('xdebug.max_nesting_level');
  if ($max_nesting_level > 0 && $max_nesting_level <= '200') {
    ini_set('xdebug.max_nesting_level', 200);
  }

  // Add custom tasks to the tasks array.
  $tasks = array();

  $tasks['capkopper_multilingual_select_features_form'] = array(
    'display_name' => st('Select features'),
    'type' => 'form',
  );

  $tasks['capkopper_multilingual_additional_modules'] = array(
    'display_name' => st('Install extra features'),
    'type' => 'batch',
  );

  // Add the Panopoly App Server to the Installation Process (OPTIONAL)
  //
  // Panopoly leverages the Apps module to enable the many apps that create
  // magic with Panopoly. In order to get this working in your install profile,
  // you need to include the following code to your profile's
  // hook_install_tasks().
  //$panopoly_server = array(
  //  'machine name' => 'panopoly',
  //  'default apps' => array('panopoly_demo'),
  //  'default content callback' => 'panopoly_default_content',
  //);
  //require_once(drupal_get_path('module', 'apps') . '/apps.profile.inc');
  //$tasks = $tasks + apps_profile_install_tasks($install_state, $panopoly_server);

  // Add the Panopoly theme selection to the installation process
  //require_once(drupal_get_path('module', 'panopoly_theme') . '/panopoly_theme.profile.inc');
  //$tasks = $tasks + panopoly_theme_profile_theme_selection_install_task($install_state);

  // Insert additional tasks here.

  $current_task = variable_get('install_task', 'done');
  $tasks['capkopper_multilingual_finalize'] = array(
    'display_name' => st('Finalize installation'),
    'type' => 'batch',
    'run' => INSTALL_TASK_RUN_IF_REACHED,
    'display' => strpos($current_task, 'capkopper_multilingual_finalize') === 0,
  );

  return $tasks;
}

/**
 * Implements hook_install_tasks_alter()
 */
function capkopper_multilingual_install_tasks_alter(&$tasks, $install_state) {
  // Magically go one level deeper in solving years of dependency problems.
  //
  // Panopoly improves the dependency checking of the core installer which helps
  // simplify sub-profiles. In order to get both of these working in your
  // install profile, you need to include the following code to your profile's
  // hook_install_tasks_alter().
  require_once(drupal_get_path('module', 'panopoly_core') . '/panopoly_core.profile.inc');
  $tasks['install_load_profile']['function'] = 'panopoly_core_install_load_profile';

  // If we only offer one language, define a callback to set this
  if (!(count(install_find_locales($install_state['parameters']['profile'])) > 1)) {
    $tasks['install_select_locale']['function'] = 'panopoly_core_install_locale_selection';
  }
}

/**
 * Implements hook_form_FORM_ID_alter()
 */
function capkopper_multilingual_form_install_configure_form_alter(&$form, $form_state) {

  // Hide some messages from various modules that are just too chatty.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Set reasonable defaults for site configuration form
  $form['site_information']['site_name']['#default_value'] = 'capKopper Multilingual';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los_Angeles'; // West coast, best coast

  // Define a default email address if we can guess a valid one
  if (valid_email_address('admin@' . $_SERVER['HTTP_HOST'])) {
    $form['site_information']['site_mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
  }

  // Do not enable the update manager module by default during installation.
  // This module probably shouldn't be enabled on productions sites where
  // performance is critical.
  $form['update_notifications']['update_status_module']['#default_value'] = array(0, 0);
}

///**
// * Implements hook_form_FORM_ID_alter()
// */
//function panopoly_form_apps_profile_apps_select_form_alter(&$form, $form_state) {
//
//  // For some things there are no need
//  $form['apps_message']['#access'] = FALSE;
//  $form['apps_fieldset']['apps']['#title'] = NULL;
//
//  // Improve style of apps selection form
//  if (isset($form['apps_fieldset'])) {
//    $manifest = apps_manifest(apps_servers('panopoly'));
//    foreach ($manifest['apps'] as $name => $app) {
//      if ($name != '#theme') {
//        $form['apps_fieldset']['apps']['#options'][$name] = '<strong>' . $app['name'] . '</strong><p><div class="admin-options"><div class="form-item">' . theme('image', array('path' => $app['logo']['path'], 'height' => '32', 'width' => '32')) . '</div>' . $app['description'] . '</div></p>';
//      }
//    }
//  }
//}

/**
 * Task callback: configure the store and select extra functionalities.
 */
function capkopper_multilingual_select_features_form() {
  drupal_set_title(st('Select features'));

  $form['functionalities'] = array(
    '#type' => 'fieldset',
    '#title' => st('Install extra features'),
    '#tree' => TRUE,
  );

  foreach (capkopper_multilingual_get_features() as $module => $info) {
    $form['functionalities'][$module] = array(
      '#type' => 'checkbox',
      '#title' => $info['title'],
    );

    if (!empty($info['description'])) {
      $form['functionalities'][$module]['#description'] = $info['description'];
    }
  }

  $form['actions'] = array('#type' => 'actions');
  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Save and continue'),
  );
  return $form;
}

/**
 * Submit callback: save store extra functionalities.
 */
function capkopper_multilingual_select_features_form_submit(&$form, &$form_state) {
  if (isset($form_state['values'])) {
    $values = $form_state['values'];

    foreach (element_children($form['functionalities']) as $key) {
      variable_set($key, !empty($values['functionalities'][$key]));
    }
  }
}

/**
 * Task callback: uses Batch API to import modules based on user selection.
 */
function capkopper_multilingual_additional_modules() {
  $modules = array();
  $features = capkopper_multilingual_get_features();

  foreach (array_keys($features) as $module) {
    if (variable_get($module, FALSE)) {
      $modules[] = $module;
    }
  }

  // Resolve the dependencies now, so that module_enable() doesn't need
  // to do it later for each individual module (which kills performance).
  $files = system_rebuild_module_data();
  $modules_sorted = array();
  foreach ($modules as $module) {
    if ($files[$module]->requires) {
      // Create a list of dependencies that haven't been installed yet.
      $dependencies = array_keys($files[$module]->requires);
      $dependencies = array_filter($dependencies, '_capkopper_multilingual_filter_dependencies');
      // Add them to the module list.
      $modules = array_merge($modules, $dependencies);
    }
  }

  foreach (array_unique($modules) as $module) {
    $modules_sorted[$module] = $files[$module]->sort;
  }
  arsort($modules_sorted);
  $operations = array();

  // Enable the selected modules.
  foreach ($modules_sorted as $module => $weight) {
    $operations[] = array('_capkopper_multilingual_enable_module', array($module, $files[$module]->info['name']));
  }

  $operations[] = array('_capkopper_multilingual_flush_caches', array(st('Flushed caches.')));

  $batch = array(
    'title' => st('Installing extra features'),
    'operations' => $operations,
    'file' => drupal_get_path('profile', 'capkopper_multilingual') . '/capkopper_multilingual.install_callbacks.inc',
  );

  return $batch;
}

/**
 * Task callback: return a batch API array with the final facelift.
 */
function capkopper_multilingual_finalize() {
  $operations = array(
    array('_capkopper_multilingual_clean_variables', array(st('Cleaning variables.')))
  );

  $batch = array(
    'title' => st('Finalize installation'),
    'operations' => $operations,
    'file' => drupal_get_path('profile', 'capkopper_multilingual') . '/capkopper_multilingual.install_callbacks.inc',
  );

  return $batch;
}

/**
 * Get the full list of extra features.
 */
function capkopper_multilingual_get_features() {
  return array(
    'capkopper_i18n_en' => array(
      'title' => st('English support'),
      'description' => st('Add translations, locale date configuration, etc.'),
    ),
    'capkopper_i18n_fr' => array(
      'title' => st('French support'),
      'description' => st('Add translations, locale date configuration, etc.'),
    ),
    'capkopper_performance' => array(
      'title' => st('Performance improvement'),
      'description' => st('Add some modules to improve the performance.'),
    ),
    'capkopper_seo' => array(
      'title' => st('SEO optimization'),
      'description' => st('Add basic support for SEO optimization.'),
    ),
    'capkopper_smtp' => array(
      'title' => st('Use capKopper SMTP gateway'),
      'description' => st('Only for users who subscribed to this service. For more information, please contact <a href="!link" target="_blank">capKopper</a>', array('!link' => 'http://www.capkopper.fr/contact')),
    ),
  );
}

/**
 * array_filter() callback used to filter out already installed dependencies.
 */
function _capkopper_multilingual_filter_dependencies($dependency) {
  return !module_exists($dependency);
}

