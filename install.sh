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

OS_LINUX="linux"
OS_SOLARIS="solaris"
OS_BSD="bsd"
OS_MACOSX="macosx"

DIST_ARCH="arch"
DIST_CENTOS="centos"
DIST_DEBIAN="debian"
DIST_FEDORA="fedora"
DIST_GENTOO="gentoo"
DIST_RHEL="rhel"
DIST_UBUNTU="ubuntu"

########################################################################################

# List of supported command line arguments (String)
SUPPORTED_ARGS="no-deps debug yes"

# List of supported short command line arguments (String)
SHORT_ARGS="n:!no-deps D:!debug y:!yes"

########################################################################################

# OS name (String)
os_name=""

# OS arch (String)
os_arch=""

# OS dist (String)
os_dist=""

# Flag will be set to true if some required apps is not installed (Boolean)
requireFailed=""

# Script directory (String)
script_dir=$(dirname "$0")

########################################################################################

# Main func
#
# *: All arguments passed to script
#
# Code: No
# Echo: No
main() {
  pushd $script_dir &> /dev/null

    detectOs
    doInstall

  popd &> /dev/null
}

# Install app
#
# Code: No
# Echo: No
doInstall() {
  requireRoot

  confirmInstall "7ZCat"

  case $os_dist in
    "$DIST_FEDORA"|"$DIST_CENTOS"|"$DIST_RHEL") requireRPM "p7zip" ;;
    "$DIST_UBUNTU"|"$DIST_DEBIAN")              requireDEB "p7zip-full" ;;
    *) error "Unsupported platform" ; requireFailed=true 
  esac

  if [[ $requireFailed ]] ; then
    show "" && exit 1
  fi

  action "Copied sript to /usr/bib directory" \
         "cp" "SOURCES/7zcat" "/usr/bin/7zcat"

  action "Added +x flag for script" \
         "chmod" "+x" "/usr/bin/7zcat"

  congratulate "7ZCat"
}

########################################################################################

# Do some install action
#
# 1: Description (String)
# *: Command
#
# Code: No
# Echo: No
action() {
  local desc="$1"

  shift 1

  if [[ $debug ]] ; then
    $@
  else
    $@ &> /dev/null
  fi
  
  if [[ $? -ne 0 ]] ; then
    show "${CL_RED}+${CL_NORM} $desc"
    error "\nError occured with last action. Install process will be interrupted.\n"
    exit 1
  else
    show "${CL_GREEN}+${CL_NORM} $desc"
  fi
}

# Check required package
#
# 1: Package name (String)
#
# Code: No
# Echo: No
require() {
  local package="$1"

  case $os_dist in
    "$DIST_FEDORA"|"$DIST_CENTOS"|"$DIST_RHEL") requireRPM "$package" ;;
    "$DIST_UBUNTU"|"$DIST_DEBIAN")              requireDEB "$package" ;;
    *) 
        error "Unsupported platform"
        requireFailed=true
  esac
}

# Check required rpm package
#
# 1: Package name (String)
#
# Code: No
# Echo: No
requireRPM() {
  if [[ $no_deps ]] ; then
    return
  fi

  local package="$1"

  rpm -q $package &> /dev/null

  if [[ $? -ne 0 ]] ; then
    warn "This app require package $package, please install it first"
    requireFailed=true
  fi
}

# Check required deb package
#
# 1: Package name (String)
#
# Code: No
# Echo: No
requireDEB() {
  if [[ $no_deps ]] ; then
    return
  fi

  local package="$1"

  dpkg -s $package &> /dev/null

  if [[ $? -ne 0 ]] ; then
    warn "This app require package $package, please install it first"
    requireFailed=true
  fi
}

# Require root priveleges
#
# Code: No
# Echo: No
requireRoot() {
  if [[ $(id -u) != "0" ]] ; then
    error "Superuser priveleges is required for install"
    exit 1
  fi
}

# Confirm install
#
# 1: App name (String)
#
# Code: Yes
# Echo: No
confirmInstall() {
  if [[ $yes ]] ; then
    show "\nArgument --yes/-y passed to script, install forced\n" $GREY
    return 0
  fi

  show ""
  show "You really want install latest version of $1? (y/N):" $CYAN

  if ! readAnswer "N" ; then
    return 1
  fi
}

# Congratulate with success install
#
# 1: App name (String)
#
# Code: No
# Echo: No
congratulate() {
  show "\nYay! $1 is successfully installed!\n" $GREEN
}

# Read user yes/no answer
#
# 1: Default value (String)
#
# Code: Yes
# Echo: No
readAnswer() {
  local defval="$1"
  local answer

  read -e -p "> " answer

  show ""

  answer=$(echo "$answer" | tr "[:lower:]" "[:upper:]")

  [[ -z $answer ]] && answer="$defval"

  if [[ ${answer:0:1} == "Y" ]] ; then
    return 0
  else
    return 1
  fi
}

# Collect system info
#
# Code: No
# Echo: No
detectOs() {
  os_name=$(uname -s)

  if [[ "$os_name" == "SunOS" ]] ; then
    os_name=$OS_SOLARIS
  elif [[ "$os_name" == "Darwon" ]]; then
    os_name=$OS_MACOSX
  elif [[ "$os_name" == "Linux" ]] ; then
    os_name="$OS_LINUX"

    if [[ -f /etc/arch-release ]] ; then
      os_dist=$DIST_ARCH
    elif [[ -f /etc/fedora-release ]] ; then
      os_dist=$DIST_FEDORA
    elif [[ -f /etc/gentoo-release ]] ; then
      os_dist=$DIST_GENTOO
    elif [[ -f /etc/redhat-release ]] ; then
      os_dist=$DIST_RHEL
    elif [[ -f /etc/SuSE-release ]] ; then
      os_dist=$DIST_SUSE
    elif [[ -f /etc/lsb-release ]] ; then
      os_dist=$DIST_UBUNTU
    fi
  fi
}

# Show error message
#
# 1: Message (String)
#
# Code: No
# Echo: No
error() {
  show "$@" $RED
}

# Show warning message
#
# 1: Message (String)
#
# Code: No
# Echo: No
warn() {
  show "$@" $BROWN
}

# Show message
#
# 1: Message (String)
# 2: Color code (Number) [Optional]
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

# Show error message about unsupported argument
#
# 1: Argument (String)
#
# Code: No
# Echo: No
showArgWarn() {
  show "Unknown argument $1." $RED
  exit 1
}

## ARGUMENTS PARSING 2 #################################################################

[[ $# -eq 0 ]] && main && exit $?

unset arg argn argm argv argt argk

argv="$*" ; argt=""

while [[ -n "$1" ]] ; do
  if [[ "$1" =~ \  && -n "$argn" ]] ; then
    declare $argn="$1"

    unset argn && shift && continue
  elif [[ $1 =~ ^-{1}[a-zA-Z0-9]{1,2}+.*$ ]] ; then
    argm=${1:1}

    if [[ \ $SHORT_ARGS\  =~ \ $argm:!?([a-zA-Z0-9_]*) ]] ; then
      arg="${BASH_REMATCH[1]}"
    else
      showArgWarn "-$argm" 2> /dev/null || :
      shift && continue
    fi

    if [[ -z "$argn" ]] ; then
      argn=$arg
    else
      [[ -z "$argk" ]] && ( showArgValWarn "--$argn" 2> /dev/null || : ) || declare $argn=true
      argn=$arg
    fi

    if [[ ! $SUPPORTED_ARGS\  =~ !?$argn\  ]] ; then
      showArgWarn "-$argm" 2> /dev/null || :
      shift && continue
    fi

    if [[ ${BASH_REMATCH[0]:0:1} == "!" ]] ; then
      declare $argn=true ; unset argn ; argk=true
    else
      unset argk
    fi

    shift && continue
  elif [[ "$1" =~ ^-{2}[a-zA-Z]{1}[a-zA-Z0-9_-]+.*$ ]] ; then
    arg=${1:2}

    if [[ $arg == *=* ]] ; then
      IFS="=" read -ra arg <<< "$arg"

      argm="${arg[0]}" ; argm=${argm//-/_}

      if [[ ! $SUPPORTED_ARGS\  =~ $argm\  ]] ; then
        showArgWarn "--${arg[0]//_/-}" 2> /dev/null || :
        shift && continue
      fi

      [[ -n "${!argm}" && $MERGEABLE_ARGS\  =~ $argm\  ]] && declare $argm="${!argm} ${arg[@]:1:99}" || declare $argm="${arg[@]:1:99}"

      unset argm && shift && continue
    else
      arg=${arg//-/_}

      if [[ -z "$argn" ]] ; then
        argn=$arg
      else
        [[ -z "$argk" ]] && ( showArgValWarn "--$argn" 2> /dev/null || : ) || declare $argn=true
        argn=$arg
      fi

      if [[ ! $SUPPORTED_ARGS\  =~ !?$argn\  ]] ; then
        showArgWarn "--${argn//_/-}" 2> /dev/null || :
        shift && continue
      fi

      if [[ ${BASH_REMATCH[0]:0:1} == "!" ]] ; then
        declare $argn=true ; unset argn ; argk=true
      else
        unset argk
      fi

      shift && continue
    fi
  else
    if [[ -n "$argn" ]] ; then
      [[ -n "${!argn}" && $MERGEABLE_ARGS\  =~ $argn\  ]] && declare $argn="${!argn} $1" || declare $argn="$1"

      unset argn && shift && continue
    fi
  fi

  argt="$argt $1" ; shift

done

[[ -n "$argn" ]] && declare $argn=true

unset arg argn argm argk

[[ -n "$KEEP_ARGS" ]] && main $argv || main ${argt:1:9999}

########################################################################################