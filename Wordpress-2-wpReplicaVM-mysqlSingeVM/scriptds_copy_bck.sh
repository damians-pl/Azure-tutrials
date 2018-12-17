#!/bin/bash
# A simple Azure Storage example script

export AZURE_STORAGE_ACCOUNT="https://storageprojectwp.blob.core.windows.net/"
export AZURE_STORAGE_ACCESS_KEY="WuOiRBM2lwVr07suTzIi15dWKoDcB9cElPoX77zy0ktPoJegoASHdDtsE7H5Eqp05jaVDlbyRzdmqe3gs78ypQ=="



l2s() {
azcopy \
  --source ${1} \
  --destination ${AZURE_STORAGE_ACCOUNT}${2} \
  --dest-key $AZURE_STORAGE_ACCESS_KEY \
  ${*:3}
}

s2l() {
azcopy \
  --source ${AZURE_STORAGE_ACCOUNT}${1} \
  --destination ${2} \
  --source-key ${AZURE_STORAGE_ACCESS_KEY} \
  ${*:3}
}

echo

case "$1" in
  l2s)
    l2s ${*:2}
    ;;
  s2l)
    s2l ${*:2}
    ;;
  *)
    echo "Usage: $0 {l2s|s2l}" >&2
    exit 1
    ;;
esac
