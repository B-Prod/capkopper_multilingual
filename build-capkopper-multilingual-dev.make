; Drush Make file

api = 2
core = 7.x

; Include the definition for how to build Drupal core directly, including patches.
includes[] = drupal-org-core-dev.make

; Download the capKopper Multilingual and recursively build its dependencies.
projects[capkopper_multilingual][type] = profile
projects[capkopper_multilingual][download][type] = git
projects[capkopper_multilingual][download][url] = git@github.com:B-Prod/capkopper_multilingual.git
projects[capkopper_multilingual][download][branch] = 7.x-1.x-dev

; You can optionally build from a local directory using the make_local drush
; module found at http://drupal.org/project/make_local.
;projects[capkopper_multilingual][download][type] = local
;projects[capkopper_multilingual][download][source] = ~/www/github/capkopper_multilingual

