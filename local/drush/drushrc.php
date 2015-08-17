<?php
/**
 * @file
 * Drush runtime config (drushrc) file.
 */

/**
 * Drush does not handle themes in profile.
 *
 * As we use Omega in the profile, we need to specify an extra path.
 *
 * @see https://github.com/drush-ops/drush/issues/1192
 */
$options['include'] = array('profiles/capkopper_multilingual/themes');

