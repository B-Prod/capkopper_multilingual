api = 2
core = 7.x

; ************************************************
; ******************** capKopper  ****************

projects[capkopper_core][type] = module
projects[capkopper_core][download][type] = git
projects[capkopper_core][download][url] = git@github.com:capKopper/capkopper_core.git
projects[capkopper_core][download][branch] = 7.x-1.x
projects[capkopper_core][subdir] = capkopper

projects[capkopper_admin][type] = module
projects[capkopper_admin][download][type] = git
projects[capkopper_admin][download][url] = git@github.com:capKopper/capkopper_admin.git
projects[capkopper_admin][download][branch] = 7.x-1.x
projects[capkopper_admin][subdir] = capkopper

projects[capkopper_et][type] = module
projects[capkopper_et][download][type] = git
projects[capkopper_et][download][url] = git@github.com:capKopper/capkopper_et.git
projects[capkopper_et][download][branch] = 7.x-1.x
projects[capkopper_et][subdir] = capkopper

projects[capkopper_i18n][type] = module
projects[capkopper_i18n][download][type] = git
projects[capkopper_i18n][download][url] = git@github.com:capKopper/capkopper_i18n.git
projects[capkopper_i18n][download][branch] = 7.x-1.x
projects[capkopper_i18n][subdir] = capkopper

projects[capkopper_pages][type] = module
projects[capkopper_pages][download][type] = git
projects[capkopper_pages][download][url] = git@github.com:capKopper/capkopper_pages.git
projects[capkopper_pages][download][branch] = 7.x-1.x
projects[capkopper_pages][subdir] = capkopper

projects[capkopper_performance][type] = module
projects[capkopper_performance][download][type] = git
projects[capkopper_performance][download][url] = git@github.com:capKopper/capkopper_performance.git
projects[capkopper_performance][download][branch] = 7.x-1.x
projects[capkopper_performance][subdir] = capkopper

projects[capkopper_seo][type] = module
projects[capkopper_seo][download][type] = git
projects[capkopper_seo][download][url] = git@github.com:capKopper/capkopper_seo.git
projects[capkopper_seo][download][branch] = 7.x-1.x
projects[capkopper_seo][subdir] = capkopper

projects[capkopper_smtp][type] = module
projects[capkopper_smtp][download][type] = git
projects[capkopper_smtp][download][url] = git@github.com:capKopper/capkopper_smtp.git
projects[capkopper_smtp][download][branch] = 7.x-1.x
projects[capkopper_smtp][subdir] = capkopper

projects[capkopper_theme][type] = module
projects[capkopper_theme][download][type] = git
projects[capkopper_theme][download][url] = git@github.com:capKopper/capkopper_theme.git
projects[capkopper_theme][download][branch] = 7.x-1.x
projects[capkopper_theme][subdir] = capkopper

projects[capkopper_user][type] = module
projects[capkopper_user][download][type] = git
projects[capkopper_user][download][url] = git@github.com:capKopper/capkopper_user.git
projects[capkopper_user][download][branch] = 7.x-1.x
projects[capkopper_user][subdir] = capkopper

projects[capkopper_widgets][type] = module
projects[capkopper_widgets][download][type] = git
projects[capkopper_widgets][download][url] = git@github.com:capKopper/capkopper_widgets.git
projects[capkopper_widgets][download][branch] = 7.x-1.x
projects[capkopper_widgets][subdir] = capkopper

; **************** End capKopper *****************
; ************************************************

; ************************************************
; ******************** Themes ********************

projects[omega][type] = theme
projects[omega][version] = 4.3

; Don't serve html5shiv from Google code repository
;projects[omega][patch][1595062] = https://www.drupal.org/files/issues/don_t_serve_html5shiv-1595062-6.patch

; ***************** End Themes *******************
; ************************************************

; ************************************************
; ***************** PANOPOLY *******************

; Note that makefiles are parsed bottom-up, and that in Drush concurrency might
; interfere with recursion.
; Therefore PANOPOLY needs to be listed AT THE BOTTOM of this makefile,
; so we can patch or update certain projects fetched by Panopoly's makefiles.

; Someday maybe we can turn this on to just inherit Panopoly
;projects[panopoly][type] = profile
;projects[panopoly][version] = 7.x-1.25
; but, Drupal.org does not support recursive profiles and also does not support
; include[] so we need to copy Panopoly's drupal-org.make file here.


; The Panopoly Foundation

projects[panopoly_core][version] = 1.25
projects[panopoly_core][subdir] = panopoly

; Update to latest Panelizer
projects[panopoly_core][patch][2429549] = https://www.drupal.org/files/issues/2429549-panopoly_core-panelizer-32.patch

; Fix some Views issues (list of Views patches).
projects[panopoly_core][patch][2477347] = https://www.drupal.org/files/issues/2477347-panopoly_core-views-2.patch

; Patches for ctools from OpenAtrium
projects[panopoly_core][patch][2477363] = https://www.drupal.org/files/issues/2477363-panopoly_core-1.25-ctools-12.patch

; Patches for entity from OpenAtrium
projects[panopoly_core][patch][2477369] = https://www.drupal.org/files/issues/2477369-panopoly_core-entity-1.patch

; Patches for entityreference from OpenAtrium
projects[panopoly_core][patch][2477375] = https://www.drupal.org/files/issues/2477375-panopoly_core-entityreference-1.patch

; Patches for token from OpenAtrium
projects[panopoly_core][patch][2477379] = https://www.drupal.org/files/issues/2477379-panopoly_core-token-1.patch

; Update Apps to 1.0
projects[panopoly_core][patch][2510944] = https://www.drupal.org/files/issues/2510944-panopoly_core-apps-1.patch

; Update views_autocomplete_filters to version 1.2
projects[panopoly_core][patch][2456255] = https://www.drupal.org/files/issues/panopoly_core-autocomplete-1.2-2456255-12.patch

projects[panopoly_images][version] = 1.25
projects[panopoly_images][subdir] = panopoly

; Manualcrop is showing for videos
projects[panopoly_images][patch][2521968] = https://www.drupal.org/files/issues/panopoly_images-manualcrop_is_showing_for_videos-2521968-1.patch

projects[panopoly_theme][version] = 1.25
projects[panopoly_theme][subdir] = panopoly

projects[panopoly_magic][version] = 1.25
projects[panopoly_magic][subdir] = panopoly

projects[panopoly_widgets][version] = 1.25
projects[panopoly_widgets][subdir] = panopoly

; Clicking images in My Library and My Files doesn't select them
projects[panopoly_widgets][patch][2473495] = https://www.drupal.org/files/issues/clicking_images_in_my-2473495-7.patch

; Patches for file_entity from OpenAtrium
projects[panopoly_widgets][patch][2477397] = https://www.drupal.org/files/issues/2477397-panopoly_widgets-file_entity-2.patch

projects[panopoly_admin][version] = 1.25
projects[panopoly_admin][subdir] = panopoly

; Patch for updating the navbar version.
projects[panopoly_admin][patch][] = local/patches/panopoly_admin-use-navbar-latest-release-custom.patch

; Patch for using the lastest version of the Simplified Menu Administration module.
projects[panopoly_admin][patch][2552723] = https://www.drupal.org/files/issues/panopoly_admin-update-the-sma-module-to-latest-version-2552723-1.25-do-not-test.patch

projects[panopoly_users][version] = 1.25
projects[panopoly_users][subdir] = panopoly

; The Panopoly Toolset

projects[panopoly_pages][version] = 1.25
projects[panopoly_pages][subdir] = panopoly

projects[panopoly_wysiwyg][version] = 1.25
projects[panopoly_wysiwyg][subdir] = panopoly

projects[panopoly_search][version] = 1.25
projects[panopoly_search][subdir] = panopoly

; Exported disabled server "Solr Server" cannot have an index attached
projects[panopoly_search][patch][2533504] = https://www.drupal.org/files/issues/2533504-1--fix_search_index_feature.patch

; For running the automated tests.

projects[panopoly_test][version] = 1.25
projects[panopoly_test][subdir] = panopoly

; **************** END PANOPOLY ****************
; **********************************************

; **********************************************
; ***************** CONTRIB ********************

; **************** END CONTRIB *****************
; **********************************************

