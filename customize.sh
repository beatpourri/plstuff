#!/bin/bash

#-------------------------- "Import" Helper COLORS -----------------------------
source $(dirname $0)/colors.sh

#-------------------------- Add local config -----------------------------
source $(dirname $0)/local_config.sh

#-------------------------- Add custom gulp tasks -----------------------------
source $(dirname $0)/add_custom_gulp_tasks.sh
