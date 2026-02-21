#!/bin/bash
########################################################################
# create a tgz file for release
# Feb-19-2026 
########################################################################

VERSION=$(cat VERSION)
PACKAGE="bash-prompt-${VERSION}"
ARCHIVE="${PACKAGE}.tar.gz"
TDIR="/tmp/${PACKAGE}"
CP="/bin/cp -fv"
RM="/bin/rm -rf"
MKDIR="/bin/mkdir -p"

remove_tdir() {
    if [[ -d ${TDIR} ]] ; then
        ${RM} ${TDIR}
    fi
}

echo "Creating release ${ARCHIVE}..."
remove_tdir
${MKDIR} ${TDIR}
${CP} VERSION README.md install.sh bash_prompt.sh "${TDIR}"
tar -czf "${ARCHIVE}" -C /tmp "${PACKAGE}"
remove_tdir
echo "Done: ${ARCHIVE}"
/bin/ls -ltr ${ARCHIVE}
