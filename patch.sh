#!/bin/bash
set -euo pipefail

gamedir="${1:-}"

[ -z "${gamedir}" ] && gamedir="${HOME}/GOG Games/Slay the Spire"

[ -n "${JAVA_HOME}" ] && JAVAC="${JAVA_HOME}bin/javac" || JAVAC="javac"

jar="${gamedir}/game/desktop-1.0.jar"

[ ! -f "${jar}" ] && { echo "${jar} not found" ; exit 1; }

[ ! -f "${JAVAC}" ] && { echo "${JAVAC} not found" ; exit 1; }

[ ! -d target ] && mkdir target

"${JAVAC}" -cp "${jar}" -d target CInputHelper.java

pushd target
zip --verbose "${jar}" -r .
popd 

