#!/bin/bash
set -x
set -e
set -u

CMAKE_BUILD_TYPE="${Configuration}"
INSTALL_DIR="${PROFILE}-${Platform}-${CMAKE_BUILD_TYPE}"
COMMIT_ID="${APPVEYOR_REPO_COMMIT}"

7z a "${INSTALL_DIR}.zip" "${INSTALL_DIR}"

github-release \
  paulthomson/thrift \
  "v-${COMMIT_ID}" \
  "${COMMIT_ID}" \
  "$(echo -e "Automated build.\n$(git log --graph -n 3 --abbrev-commit --pretty='format:%h - %s <%an>')")" \
  "${INSTALL_DIR}.zip"

