api = 2
core = 7.x

; Drupal Core
projects[drupal][type] = core
projects[drupal][version] = 7.44

; ***** Patches from Panopoly *******
; Bug with image styles on database update
projects[drupal][patch][1973278] = http://www.drupal.org/files/issues/image-accommodate_missing_definition-1973278-16.patch
; ***** End of Panopoly patches *****

; *********** PATCHES ************

; Patch for allowing empty error messages in form API.
projects[drupal][patch][289452] = local/patches/drupal-289452-form-set-empty-error-D7_58_custom.patch

; Saving an Image field with an image that has undeterminable dimensions throws PDOException.
projects[drupal][patch][1330952] = local/patches/drupal-image-undeterminable-dimensions-error-1330952-custom.patch

; Patch for handling inherited profiles
projects[drupal][patch][2067229] = https://www.drupal.org/files/issues/drupal-inheritable-profiles-2067229-47.patch

; Patch for fixing node_access across non-required Views relationships
projects[drupal][patch][1349080] = https://www.drupal.org/files/issues/1349080-269-d7-access_subquery_placeholder_counter_fix-and-test.patch

; Patch for simpletest
projects[drupal][patch][911354] = http://drupal.org/files/911354-drupal-profile-85.patch

; Patch to allow install profile enabling to enable dependencies correctly.
projects[drupal][patch][1093420] = https://www.drupal.org/files/issues/drupal-simpletestprofiledependencies-1093420-27-7.x.patch

; Build menu_tree without loading so many objects
projects[drupal][patch][1978176] = https://www.drupal.org/files/issues/drupal-1978176-menu_load_objects-75.patch

; Patch to prevent empty titles when menu_check_access called more than once
#projects[drupal][patch][1697570] = https://www.drupal.org/files/drupal7.menu-system.1697570-29.patch

; Patch to move registry build so entity_get_info can be called during install.
projects[drupal][patch][1311820] = https://www.drupal.org/files/issues/1311820-drupal-registry_update-13.patch

; Make node access queries more performant
projects[drupal][patch][106721] = https://www.drupal.org/files/issues/106721-drupal-optomize-queries-1349080-121-do-not-test.patch

; Cache user grants.
projects[drupal][patch][2199001] = https://www.drupal.org/files/issues/node_access_grants-static-cache-16.patch

; Fix javascript error with angular
projects[drupal][patch][2492993] = https://www.drupal.org/files/issues/2492993-drupal-hash-1.patch

; Fixes sticky headers are not calculating the column widths properly.
projects[drupal][patch][2097081] = https://www.drupal.org/files/2097081-fix-sticky-header-column-width-7.x-6.patch

; vertical tabs: Uncaught Error: Syntax error, unrecognized expression: #/<whatever>
projects[drupal][patch][2492993] = https://www.drupal.org/files/issues/2492993-drupal-hash-1.patch

; Prevent Drupal from scanning node_module and bower_component directories in theme
projects[drupal][patch][2329453] = https://www.drupal.org/files/issues/ignore_front_end_vendor-2329453-111.patch

; field_default_view() resets delta values due to array_merge()
projects[drupal][patch][2430399] = https://www.drupal.org/files/issues/2430399-field-default-view-resets-deltas.patch

