#!/bin/bash

#-------------------------- Vars -----------------------------
LOCAL_GULP_CONFIG_FILE="./local.gulp-config.js"
ORIGINAL_LOCAL_GULP_CONFIG_FILE="./node_modules/emulsify-gulp/gulp-config.js"

#-------------------------- Add local config -----------------------------

# Check if there is already 'local.gulp-config.js'
if [ -f $LOCAL_GULP_CONFIG_FILE ]
then
echo -e "${green} $LOCAL_GULP_CONFIG_FILE was found...${NC}"
else
# No local.gulp-config.js
  echo -e "${red} NO local.gulp-config.js was found...${NC}"
  echo "Adding local.gulp-config.js..."
  cp $ORIGINAL_LOCAL_GULP_CONFIG_FILE $LOCAL_GULP_CONFIG_FILE
  echo -e "${green} Done...${NC}"
fi
