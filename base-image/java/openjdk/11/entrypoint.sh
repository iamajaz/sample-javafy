#!/bin/bash
if [[ ! -v "$EXT_JAVA_OPTS" ]]; then
    echo "EXT_JAVA_OPTS is not set"
elif [[ -z "$EXT_JAVA_OPTS" ]]; then
    echo "EXT_JAVA_OPTS is set to the empty string"
else
    echo "EXT_JAVA_OPTS is set and will be added to JAVA_OPTS"
    export JAVA_OPTS="$JAVA_OPTS":"$EXT_JAVA_OPTS"
fi

FILE=/app.jar
if [ -f "$FILE" ]; then
    echo "Applilcation executable '$FILE' exists."
    echo "[startup] Starting java application"
    exec java -javaagent:/opt/dd-java-agent.jar $JAVA_OPTS -jar "$FILE"
else
    echo "Applilcation executable '$FILE' not exist."
    echo "[startup] Starting jshell"
    exec jshell
fi
