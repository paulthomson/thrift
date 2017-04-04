#!/bin/bash
set -x
set -e
set -u


INSTALL_DIR="${BUILD_PLATFORM}-${CMAKE_BUILD_TYPE}"
COMMIT_ID="${TRAVIS_COMMIT}"

zip -r "${INSTALL_DIR}.zip" "${INSTALL_DIR}"

github-release \
  paulthomson/thrift \
  "v-${COMMIT_ID}" \
  "${COMMIT_ID}" \
  "$(echo -e "Automated build.\n$(git log --graph -n 3 --abbrev-commit --pretty='format:%h - %s <%an>')")" \
  "${INSTALL_DIR}.zip"


