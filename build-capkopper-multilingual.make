; Drush Make file
;
; Use this file to build a full distribution including Drupal core and the
; "capKopper Multilingual" distribution using the following command...
;
; drush --no-patch-txt make build-capkopper-multilingual.make <target directory>

api = 2
core = 7.x

; Include the definition for how to build Drupal core directly, including
; patches.

includes[] = drupal-org-core.make

; Download the capKopper Multilingual and recursively build all
; of its dependencies.

projects[capkopper_multilingual][type] = profile
projects[capkopper_multilingual][download][type] = git
projects[capkopper_multilingual][download][url] = git@github.com:capKopper/capkopper_multilingual.git
projects[capkopper_multilingual][download][branch] = 7.x-1.x

# For local development.
;projects[capkopper_multilingual][download][type] = local
;projects[capkopper_multilingual][download][source] = ~/www/github/capkopper_multilingual

