#!/bin/bash
#-------------------------- "Import" Helper COLORS -----------------------------
source $(dirname $0)/colors.sh

#-------------------------- Vars -----------------------------
CUSTOM_GULP_TASKS_DIR_NAME="custom-tasks"
CUSTOM_GULP_TASKS_FILE_NAME="gulp-custom-tasks.js"
CUSTOM_GULP_TASKS_DIR="./$CUSTOM_GULP_TASKS_DIR_NAME/"
CUSTOM_GULP_TASKS_FILE_PATH="$CUSTOM_GULP_TASKS_DIR/$CUSTOM_GULP_TASKS_FILE_NAME"


#-------------------------- Add custom gulp tasks -----------------------------

# Check if there are custom-gulp-tasks
if ! [ -f $CUSTOM_GULP_TASKS_FILE_PATH ]
then

# Create Custom gulp tasks
  echo "Adding custom gulp tasks..."
  mkdir $CUSTOM_GULP_TASKS_DIR_NAME

# Add code to gulp-custom-tasks.js
  echo "/* globals require */
// eslint-disable-next-line strict
'use strict';

// General
var gulp = require('gulp-help')(require('gulp'));
var localConfig = {};

try {
    localConfig = require('./local.gulp-config');
}
catch (e) {
    if (e.code !== 'MODULE_NOT_FOUND') {
        throw e;
    }
}

/* Custom tasks */" >> $CUSTOM_GULP_TASKS_FILE_PATH

# ADD custom gulp task to local.gulp-config.js
  echo "/* Custom tasks */
require('./custom-tasks/gulp-custom-tasks.js');" >> $LOCAL_GULP_CONFIG_FILE
  echo -e "${green} DONE ${NC}"
  echo "Just copy your custom gulp tasks code to:"
  echo -e "${yellow} $CUSTOM_GULP_TASKS_FILE_PATH ${NC}"
else
  echo -e "${green} There are already custom gulp tasks...${NC}"
fi