#!/usr/bin/env sh

if [ -z "${LOG_LIB_LOADED}" ]; then
  LOG_LIB_LOADED="1"

  export LVL_CRITICAL=0
  export LVL_ERROR=1
  export LVL_WARNING=2
  export LVL_INFO=3
  export LVL_DEBUG=4
  export LVL_TRACE=5

  export CURRENT_LEVEL=${LVL_INFO}

  _get_level_str() {
    case "$1" in
      0)
        echo "CRITICAL"
        ;;
      1)
        echo "ERROR"
        ;;
      2)
        echo "WARNING"
        ;;
      3)
        echo "INFO"
        ;;
      4)
        echo "DEBUG"
        ;;
      5)
        echo "TRACE"
        ;;
    esac
  }

  _get_format_str() {
    format_date="$(date +%Y%m%d:%H%M%S)"
    format_string="${format_date} %-8s $1\n"
    echo  "${format_string}"
  }

  _log() {
    level="$1"
    shift
    format=$(_get_format_str "$1")
    shift
    if [ "${level}" -le "${CURRENT_LEVEL}" ]; then
      level_str=$(_get_level_str "${level}")
      printf "${format}" "${level_str}" "$@" 1>&2
    fi
  }

  logCritical() {
    _log "${LVL_CRITICAL}" "$@"
  }
  logError() {
    _log "${LVL_ERROR}" "$@"
  }
  logWarning() {
    _log "${LVL_WARNING}" "$@"
  }
  logInfo() {
    _log "${LVL_INFO}" "$@"
  }
  logDebug() {
    _log "${LVL_DEBUG}" "$@"
  }
  logTrace() {
    _log "${LVL_TRACE}" "$@"
  }

  setLogLevel() {
    CURRENT_LEVEL=$1
  }
else
  logDebug "Log lib already loaded"
fi
