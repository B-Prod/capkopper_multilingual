#!/bin/sh
# Script to build capKopper distribution
# Make sure the correct number of args was passed from the command line
if [ $# -eq 0 ]; then
  echo "Usage $0 [-d] target_build_dir"
  exit 1
fi

shift $((OPTIND-1))
TARGET=$1
# Make sure we have a target directory
if [ -z "$TARGET" ]; then
  echo "Usage $0 target_build_dir"
  exit 2
fi
CURDIR=`pwd -P`
ORIG_TARGET=$TARGET
TARGET=$TARGET"__build"
CALLPATH=`dirname "$0"`
ABS_CALLPATH=`cd "$CALLPATH"; pwd -P`

echo '            ,,,,,,,,  ,,,,,,,,.'
echo '        ;############# ##########   ,,,.'
echo '      ;###############  °#########  #######'
echo '    ;#################    °################'
echo '    ##################     °###############'
echo '    ########@                °#############'
echo '    ########@                 %#############'
echo '    ########@               ;###############'
echo '    %#################     #################'
echo '     %################   ;########; ########'
echo "      %############### ;########;   '''\`"
echo "        %@@#########  #########'"
echo
echo '  __|              |  /'
echo ' (      _\` |  _ \  . <    _ \  _ \  _ \   -_)   _|'
echo '\___| \__,_| .__/ _|\_\ \___/ .__/ .__/ \___| _|'
echo '            _|               _|   _|'

set -e
echo "Building to build dir: $TARGET"
# Remove current drupal dir
if [ -e "$TARGET" ]; then
  echo 'Removing old build directory...'
  rm -rf "$TARGET"
fi
# Do the build (Release version)
MAKEFILE='build-capkopper-multilingual.make'
DRUSH_OPTS='--no-cache --prepare-install'
echo 'Running drush make...'
drush make $DRUSH_OPTS "$ABS_CALLPATH/$MAKEFILE" "$TARGET"

set +e
# check to see if drush make was successful by checking for capkopper_core module
if [ -e "$TARGET/profiles/capkopper_multilingual/modules/capkopper/capkopper_core" ]; then
  mv $TARGET $ORIG_TARGET
  DRUPAL=`cd "$ORIG_TARGET"; pwd -P`

  echo "Active site now in: $DRUPAL"

  # Copy libraries from profile into site libraries
  # Modules properly using Library API don't need this, but many modules
  # don't support libraries in the profile (like WYSIWYG)
  #echo "Copying library files."
  #rsync -r $DRUPAL/profiles/capkopper_multilingual/libraries/ $DRUPAL/sites/all/libraries/

  # Copy the drushrc.php file to take care of theme commands from inside the profile folder.
  cp "$ABS_CALLPATH/local/drush" "$DRUPAL/sites/all/" -r
  drush cc drush

  # Remove files used by Make Local.
  if [ -e "$DRUPAL/profiles/capkopper_multilingual/local" ]; then
    echo "Remove the local folder that was used for the build (@see Make Local plugin for Drush)."
    rm -rf "$DRUPAL/profiles/capkopper_multilingual/local"
  fi

  if [ ! -e "$DRUPAL/sites/default/settings.php" ]; then
    echo "No settings.php file found"
    echo "Please run the install.php script to install Drupal"
    exit 1
  fi

  echo 'Build completed successfully!'
else
  echo 'Error in build.'
  exit 2
fi
