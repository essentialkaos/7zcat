#!/usr/bin/env bash

########################################################################################

NORM=0
BOLD=1
UNLN=4
RED=31
GREEN=32
BROWN=33
BLUE=34
MAG=35
CYAN=36
GREY=37

CL_NORM="\e[${NORM}m"
CL_BOLD="\e[${BOLD}m"
CL_UNLN="\e[${UNLN}m"
CL_RED="\e[${RED}m"
CL_GREEN="\e[${GREEN}m"
CL_BROWN="\e[${BROWN}m"
CL_BLUE="\e[${BLUE}m"
CL_MAG="\e[${MAG}m"
CL_CYAN="\e[${CYAN}m"
CL_GREY="\e[${GREY}m"
CL_BL_RED="\e[${RED};1m"
CL_BL_GREEN="\e[${GREEN};1m"
CL_BL_BROWN="\e[${BROWN};1m"
CL_BL_BLUE="\e[${BLUE};1m"
CL_BL_MAG="\e[${MAG};1m"
CL_BL_CYAN="\e[${CYAN};1m"
CL_BL_GREY="\e[${GREY};1m"
CL_UL_RED="\e[${RED};4m"
CL_UL_GREEN="\e[${GREEN};4m"
CL_UL_BROWN="\e[${BROWN};4m"
CL_UL_BLUE="\e[${BLUE};4m"
CL_UL_MAG="\e[${MAG};4m"
CL_UL_CYAN="\e[${CYAN};4m"
CL_UL_GREY="\e[${GREY};4m"
CL_BG_RED="\e[${RED};7m"
CL_BG_GREEN="\e[${GREEN};7m"
CL_BG_BROWN="\e[${BROWN};7m"
CL_BG_BLUE="\e[${BLUE};7m"
CL_BG_MAG="\e[${MAG};7m"
CL_BG_CYAN="\e[${CYAN};7m"
CL_BG_GREY="\e[${GREY};7m"

########################################################################################

# Default password
PASSWORD="test"

# Path to dir with test data
DATA_DIR=".travis/data"

# Path to 7zcat script
Z7CAT="SOURCES/7zcat"

########################################################################################

# Main func
#
# 1: All arguments passed to script 
#
# Code: No
# Echo: No
main() {
  local base_file="$DATA_DIR/test.txt"
  local comp_file="$DATA_DIR/test.7z"
  local pswd_file="$DATA_DIR/test-pswd.7z"

  local base_hash=$(cat "$base_file" | sha256sum | cut -f1 -d" ")
  local comp_hash=$(. $Z7CAT $comp_file | sha256sum | cut -f1 -d" ")
  local pswd_hash=$(. $Z7CAT -p $PASSWORD $comp_file | sha256sum | cut -f1 -d" ")

  local has_errors=""

  show ""

  if [[ "$comp_hash" == "$base_hash" ]] ; then
    show "Passwordless 7z file:       ${CL_GREEN}OK${CL_NORM}"
  else
    show "Passwordless 7z file:       ${CL_RED}ERROR${CL_NORM} ($base_hash ≠ $comp_hash)"
    has_errors=true
  fi

  if [[ "$comp_hash" == "$base_hash" ]] ; then
    show "Password protected 7z file: ${CL_GREEN}OK${CL_NORM}"
  else
    show "Password protected 7z file: ${CL_RED}ERROR${CL_NORM} ($base_hash ≠ $comp_hash)"
    has_errors=true
  fi

  if [[ $has_errors ]] ; then
    show "TEST FAILED" $CL_GREEN
    exit 1
  fi

  show "TEST PASSED" $CL_GREEN

  exit 0
}

# Show message
#
# 1: Message (String)
# 2: Message color (Number) [Optional]
#
# Code: No
# Echo: No
show() {
  if [[ -n "$2" ]] ; then
    echo -e "\e[${2}m${1}${CL_NORM}"
  else
    echo -e "$@"
  fi
}

########################################################################################

main $@
