#!/bin/bash

#-------------------------- Vars -----------------------------

CHECK_CUSTOM_SCRIPTS_DIR="./scripts"

CHECK_CUSTOM_GULP_TASKS="$CHECK_CUSTOM_SCRIPTS_DIR/add_custom_gulp_tasks.sh"
CHECK_CUSTOM_COMPONENT="$CHECK_CUSTOM_SCRIPTS_DIR/add_new_component.sh"
CHECK_CUSTOM_COLORS="$CHECK_CUSTOM_SCRIPTS_DIR/colors.sh"
CHECK_CUSTOM_CUSTOMIZE="$CHECK_CUSTOM_SCRIPTS_DIR/customize.sh"
CHECK_CUSTOM_LOCAL_CONFIG="$CHECK_CUSTOM_SCRIPTS_DIR/local_config.sh"

#-------------------------- Add custom scripts -----------------------------

# Check if there is a custom gulp task script
if ! [ -f "$CHECK_CUSTOM_GULP_TASKS" ];
then
    curl https://raw.githubusercontent.com/beatpourri/plstuff/master/scripts/add_custom_gulp_tasks.sh -o $CHECK_CUSTOM_GULP_TASKS
fi

# Check if there is a custom component
if ! [ -f "$CHECK_CUSTOM_COMPONENT" ];
then
    curl https://raw.githubusercontent.com/beatpourri/plstuff/master/scripts/add_new_component.sh -o $CHECK_CUSTOM_COMPONENT
fi


# Check if there is a custom color
if ! [ -f "$CHECK_CUSTOM_COLORS" ];
then
 curl https://raw.githubusercontent.com/beatpourri/plstuff/master/scripts/colors.sh -o $CHECK_CUSTOM_COLORS
fi



# Check if there is a customize
if ! [ -f "$CHECK_CUSTOM_CUSTOMIZE" ];
then
    curl https://raw.githubusercontent.com/beatpourri/plstuff/master/scripts/customize.sh -o $CHECK_CUSTOM_CUSTOMIZE
fi

# Check if there is local config
if ! [ -f "$CHECK_CUSTOM_LOCAL_CONFIG" ];
then
    curl https://raw.githubusercontent.com/beatpourri/plstuff/master/scripts/local_config.sh -o $CHECK_CUSTOM_LOCAL_CONFIG
fi

echo "Custom scripts added."