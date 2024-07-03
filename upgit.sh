#!/bin/bash

function ayuda() {
  echo "${USO}"
  if [[ ${1} ]]; then
    echo ${1}
  fi
}

while getopts ":m:a" OPCION; do
  case ${OPCION} in
    m ) COMMIT_MSG=$OPTARG
        echo "Parameter COMMIT_MESSAGE set to '${COMMIT_MSG}'";;
    a ) ayuda; exit 0;;
    : ) ayuda "Missing parameter for -$OPTARG"; exit 1;;
    \?) ayuda "Unknown option: -$OPTARG"; exit 1;;
  esac
done

if [ -z "${COMMIT_MSG}" ]; then
  ayuda "The commit message (-m) must be specified"; exit 1
fi



git add .
git commit -m "${COMMIT_MSG}"
git push
