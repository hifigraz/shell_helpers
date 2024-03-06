# Shell Helper scripts

some shell helper scripts.

## Log

source log.sh, and you can use the following commands and variables:

### Variables

```
LVL_CRITICAL
LVL_ERROR
LVL_WARNING
LVL_INFO
LVL_DEBUG
LVL_TRACE
```

### Commands

```
logCritical()
logError()
logWarning()
logInfo()
logDebug()
logTrace()

setLogLevel()
```

As parameter for setLogLevel one of the LVL* Variables can be used.

As parameters for the log* commands, a format_string and its values should be used.

