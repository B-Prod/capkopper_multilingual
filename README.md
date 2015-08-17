# capKopper Multilingual distribution
-------------------------------------

capKopper Multilingual is a Drupal distribution based on Panopoly, that adds some
features and configuration for maltilingual sites.

## CONTENTS OF THIS FILE

 * Introduction
 * System Requirements
 * Issues
 * Manual Build
 * Update The Distribution
 * Clearing The Cache

## SYSTEM REQUIREMENTS

In addition to the normal Drupal 7 requirements, you should ensure your PHP
memory_limit (php.ini) is set to at least 128M and your MySQL
max_allowed_packet (my.cnf) is at least 32M.

## ISSUES

This issue needs to be fixed: https://www.drupal.org/node/2183937

## UPDATING THE DISTRIBUTION

Please have a look on this article regarding Panopoly:
 * https://www.drupal.org/node/2272177

## CLEARING THE CACHE

If you are installing for the first time, ignore this section. If you are
updating your distribution you'll need to run a couple of commands to clear
the drupal cache and update your database:

drush updb
:   This is the same as running the update.php script on your site and is
    needed to run any update hooks required for the new version.

drush rr
:   This is an OPTIONAL command but is sometimes needed if modules or files
    have moved to a different directory location within the distribution.
    If you get weird errors when clearing cache after an update, try this
    command.
    It is a shortcut for the "registry rebuild" command which might need to
    be installed into drush separately.

drush cc all
:   This clears the Drupal database cache and is the same as clicking "Clear
    All Caches" from the admin/config/development/performance page on your
    site. This drush command lets you clear cache from the command line more
    quickly.

drush fra -y (Read notes first)
:   This command is required to update all of distribution features to the
    latest version. Running it will revert and overwrite any existing
    features, including any changes that you may have made to the distribution's
    configuration. It is therefore very important to capture any customization
    using the Features Override module before running this command. This
    command can be run at any other time to restore the initial distribution's
    features to their default settings (Eg: if someone has inadvertently tampered
    with any Views or layouts).

