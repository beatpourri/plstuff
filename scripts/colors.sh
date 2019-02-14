#!/bin/bash
#-------------------------- Helper functions - COLORS -----------------------------

# Console colors
red='\033[0;31m'
red_bold='\033[1;31m'
red_bg='\033[1;37;41m'

green='\033[0;32m'
green_bold='\033[1;32m'
green_bg='\033[1;30;42m'
green_bg_white_txt='\033[1;42m'

yellow='\033[33m'
yellow_bold='\033[1;33m'
yellow_bg='\033[1;30;43m'

cyan='\033[36m'
cyan_bold='\033[1;36m'
cyan_bg='\033[1;37;46m'

NC='\033[0m'

echo-red () { echo -e "${red}$1${NC}"; }
echo-red-bold () { echo -e "${red_bold}$1${NC}"; }
echo-red-bg () { echo -e "${red_bg}$1${NC}"; }

echo-green () { echo -e "${green}$1${NC}"; }
echo-green-bold () { echo -e "${green_bold}$1${NC}"; }
echo-green-bg () { echo -e "${green_bg}$1${NC}"; }
echo-green-bg-white-txt () { echo -e "${green_bg_white_txt}$1${NC}"; }

echo-yellow () { echo -e "${yellow}$1${NC}"; }
echo-yellow-bold () { echo -e "${yellow_bold}$1${NC}"; }
echo-yellow-bg () { echo -e "${yellow_bg}$1${NC}"; }

echo-cyan () { echo -e "${cyan}$1${NC}"; }
echo-cyan-bold () { echo -e "${cyan_bold}$1${NC}"; }
echo-cyan-bg () { echo -e "${cyan_bg}$1${NC}"; }

#-------------------------- END: Helper functions - COLORS -----------------------------

