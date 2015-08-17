<?php
/**
 * @file
 * Contains Batch API callbacks used during installation.
 */

/**
 * BatchAPI callback.
 *
 * Enable extra modules.
 */
function _capkopper_multilingual_enable_module($module, $module_name, &$context) {
  module_enable(array($module), FALSE);
  $context['message'] = st('Installed %module module.', array('%module' => $module_name));
}

/**
 * BatchAPI callback.
 *
 * Flush Drupal cache.
 */
function _capkopper_multilingual_flush_caches($operation, &$context) {
  $context['message'] = t('@operation', array('@operation' => $operation));
  drupal_flush_all_caches();
}

/**
 * BatchAPI callback.
 *
 * Clean up Drupal variables.
 */
function _capkopper_multilingual_clean_variables($operation, &$context) {
  $context['message'] = t('@operation', array('@operation' => $operation));
  $features = capkopper_multilingual_get_features();

  foreach (array_keys($features) as $module) {
    variable_del($module);
  }
}
