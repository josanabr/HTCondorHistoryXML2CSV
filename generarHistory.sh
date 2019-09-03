#!/usr/bin/env bash
if [ ! $# -eq 2 ]; then
  echo "Se esperan dos argumentos"
  exit -1
fi
time condor_history -xml > "${1}"
mv "${1}" "${2}"
