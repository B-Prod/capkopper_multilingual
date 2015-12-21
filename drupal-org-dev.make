api = 2
core = 7.x

; ************************************************
; ******************** capKopper  ****************

projects[capkopper_core][type] = module
projects[capkopper_core][download][type] = git
projects[capkopper_core][download][url] = git@github.com:capKopper/capkopper_core.git
projects[capkopper_core][download][branch] = 7.x-1.x-dev
projects[capkopper_core][subdir] = capkopper

projects[capkopper_admin][type] = module
projects[capkopper_admin][download][type] = git
projects[capkopper_admin][download][url] = git@github.com:capKopper/capkopper_admin.git
projects[capkopper_admin][download][branch] = 7.x-1.x-dev
projects[capkopper_admin][subdir] = capkopper

projects[capkopper_et][type] = module
projects[capkopper_et][download][type] = git
projects[capkopper_et][download][url] = git@github.com:capKopper/capkopper_et.git
projects[capkopper_et][download][branch] = 7.x-1.x-dev
projects[capkopper_et][subdir] = capkopper

projects[capkopper_i18n][type] = module
projects[capkopper_i18n][download][type] = git
projects[capkopper_i18n][download][url] = git@github.com:capKopper/capkopper_i18n.git
projects[capkopper_i18n][download][branch] = 7.x-1.x-dev
projects[capkopper_i18n][subdir] = capkopper

projects[capkopper_pages][type] = module
projects[capkopper_pages][download][type] = git
projects[capkopper_pages][download][url] = git@github.com:capKopper/capkopper_pages.git
projects[capkopper_pages][download][branch] = 7.x-1.x-dev
projects[capkopper_pages][subdir] = capkopper

projects[capkopper_performance][type] = module
projects[capkopper_performance][download][type] = git
projects[capkopper_performance][download][url] = git@github.com:capKopper/capkopper_performance.git
projects[capkopper_performance][download][branch] = 7.x-1.x-dev
projects[capkopper_performance][subdir] = capkopper

projects[capkopper_seo][type] = module
projects[capkopper_seo][download][type] = git
projects[capkopper_seo][download][url] = git@github.com:capKopper/capkopper_seo.git
projects[capkopper_seo][download][branch] = 7.x-1.x-dev
projects[capkopper_seo][subdir] = capkopper

projects[capkopper_smtp][type] = module
projects[capkopper_smtp][download][type] = git
projects[capkopper_smtp][download][url] = git@github.com:capKopper/capkopper_smtp.git
projects[capkopper_smtp][download][branch] = 7.x-1.x-dev
projects[capkopper_smtp][subdir] = capkopper

projects[capkopper_theme][type] = module
projects[capkopper_theme][download][type] = git
projects[capkopper_theme][download][url] = git@github.com:capKopper/capkopper_theme.git
projects[capkopper_theme][download][branch] = 7.x-1.x-dev
projects[capkopper_theme][subdir] = capkopper

projects[capkopper_user][type] = module
projects[capkopper_user][download][type] = git
projects[capkopper_user][download][url] = git@github.com:capKopper/capkopper_user.git
projects[capkopper_user][download][branch] = 7.x-1.x-dev
projects[capkopper_user][subdir] = capkopper

projects[capkopper_widgets][type] = module
projects[capkopper_widgets][download][type] = git
projects[capkopper_widgets][download][url] = git@github.com:capKopper/capkopper_widgets.git
projects[capkopper_widgets][download][branch] = 7.x-1.x-dev
projects[capkopper_widgets][subdir] = capkopper

; **************** End capKopper *****************
; ************************************************

includes[] = make/omega-dev.make

; Note that makefiles are parsed bottom-up, and that in Drush concurrency might
; interfere with recursion.
; Therefore PANOPOLY needs to be listed AT THE BOTTOM of this makefile,
; so we can patch or update certain projects fetched by Panopoly's makefiles.
includes[] = make/panopoly-dev.make

