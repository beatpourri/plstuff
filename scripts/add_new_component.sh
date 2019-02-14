#!/bin/bash
#-------------------------- "Import" Helper COLORS -----------------------------
source $(dirname $0)/colors.sh

#-------------------------- Vars -----------------------------

NEW_COMPONENTS_DIR="./tools"
NEW_COMPONENTS_DEPENDENCIES="./package.json"

#-------------------------- Add task to create new patternlab component -----------------------------

# Check if there is tools directory

if [ -d "$NEW_COMPONENTS_DIR" ];
then
    echo "...Checking"
else
    echo -e "${yellow} Fetching tools directory....${NC}"
    git clone --depth 1 https://github.com/beatpourri/plstuff.git tools
# remove unused stuff
    cd tools
    git filter-branch --prune-empty --subdirectory-filter tools HEAD
#remove .git
    rm -rf .git
    cd ../
    echo -e "${green} $NEW_COMPONENTS_DIR directory was added.${NC}"
fi

# Add all dependencies to package.json
if grep -q yeoman-generator "$NEW_COMPONENTS_DEPENDENCIES";
then
    echo -e "${green}There is already everything there.${NC}"
    echo -e "${green}You can add new components.${NC}"
    echo "with:"
    echo -e "${yellow}yarn new ${NC}"
    echo "or"
    echo -e "${yellow}npm run new ${NC}"
else
    echo -e "${yellow}Checking for missing dependencies${NC}"
    echo "This might take some time..."
    yarn add lodash.assign@4.2.0 lodash.includes@4.1.3 lodash.merge@4.6.0 yeoman-generator@0.23.3 yo@1.8.5 --dev
    echo -e "${green}You can add new components${NC}"
    echo  "with:"
    echo -e "${yellow}yarn new ${NC}"
    echo  "or"
    echo -e "${yellow}npm run new ${NC}"
fi

# Add "script-task" to package.json for "yarn new" or "npm new"
if ! grep -q generate-new-component "$NEW_COMPONENTS_DEPENDENCIES";
then
echo "Please add the following to the 'scripts section' in your package.json file:"
    echo -e "${yellow}
    \"new\": \"yo ./tools/generate-new-component/index.js\",
    ${NC}"
fi

