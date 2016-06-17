api = 2
core = 7.x

; The Panopoly Foundation

projects[panopoly_core][version] = 1.29
projects[panopoly_core][subdir] = panopoly

; Update to latest Panelizer
projects[panopoly_core][patch][2429549] = https://www.drupal.org/files/issues/2429549-panopoly_core-panelizer-32.patch

; Fix some Views issues (list of Views patches).
projects[panopoly_core][patch][2477347] = https://www.drupal.org/files/issues/2477347-panopoly_core-views-2.patch

; Patches for ctools from OpenAtrium
projects[panopoly_core][patch][2477363] = https://www.drupal.org/files/issues/2477363-panopoly_core-ctools-16.patch

; Additional patches for ctools (custom)
projects[panopoly_core][patch][] = local/patches/panopoly_core-ctools-update-custom.patch

; Patches for entity from OpenAtrium
projects[panopoly_core][patch][2477369] = https://www.drupal.org/files/issues/2477369-panopoly_core-entity-3.patch

; Patches for entityreference from OpenAtrium
projects[panopoly_core][patch][2477375] = https://www.drupal.org/files/issues/2477375-panopoly_core-entityreference-1.patch

; Patches for token from OpenAtrium
projects[panopoly_core][patch][2477379] = https://www.drupal.org/files/issues/2477379-panopoly_core-token-1.patch

; Additional patches for various modules (custom)
projects[panopoly_core][patch][] = local/patches/panopoly_core-various-modules-update-custom.patch

projects[panopoly_images][version] = 1.29
projects[panopoly_images][subdir] = panopoly

; Manualcrop is showing for videos
projects[panopoly_images][patch][2521968] = https://www.drupal.org/files/issues/panopoly_images-manualcrop_is_showing_for_videos-2521968-1.patch

projects[panopoly_theme][version] = 1.29
projects[panopoly_theme][subdir] = panopoly

; Additional patches to reduce downloaded (useless) modules (custom)
projects[panopoly_theme][patch][] = local/patches/panopoly_theme-custom.patch

projects[panopoly_magic][version] = 1.29
projects[panopoly_magic][subdir] = panopoly

projects[panopoly_widgets][version] = 1.29
projects[panopoly_widgets][subdir] = panopoly

; Clicking images in My Library and My Files doesn't select them
projects[panopoly_widgets][patch][2473495] = https://www.drupal.org/files/issues/2473495-panopoly_widgets-media-14.patch

; Patches for file_entity from OpenAtrium
projects[panopoly_widgets][patch][2477397] = https://www.drupal.org/files/issues/2477397-panopoly_widgets-file_entity-2.patch

projects[panopoly_admin][version] = 1.29
projects[panopoly_admin][subdir] = panopoly

; Patch for updating the navbar version.
projects[panopoly_admin][patch][] = local/patches/panopoly_admin-use-navbar-latest-release-custom.patch

projects[panopoly_users][version] = 1.29
projects[panopoly_users][subdir] = panopoly

; The Panopoly Toolset

projects[panopoly_pages][version] = 1.29
projects[panopoly_pages][subdir] = panopoly

projects[panopoly_wysiwyg][version] = 1.29
projects[panopoly_wysiwyg][subdir] = panopoly

; Additional patches for various modules (custom)
projects[panopoly_wysiwyg][patch][] = local/patches/panopoly_wysiwyg-various-modules-update-custom.patch

projects[panopoly_search][version] = 1.29
projects[panopoly_search][subdir] = panopoly

; Additional patches for various modules (custom)
projects[panopoly_search][patch][] = local/patches/panopoly_search-various-modules-update-custom.patch

; For running the automated tests.

projects[panopoly_test][version] = 1.29
projects[panopoly_test][subdir] = panopoly

