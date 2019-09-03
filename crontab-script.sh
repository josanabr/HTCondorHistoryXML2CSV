#!/usr/bin/env bash
CURRENT_DIR=$(pwd)
SALIDA=$( ${CURRENT_DIR}/prepararEntornoExe.sh )
DIR=$(echo ${SALIDA} | cut -d '[' -f 2 | cut -d ']' -f 1)
echo "Yendo a directorio ${CURRENT_DIR}/${DIR}"
cd ${CURRENT_DIR}/${DIR}
echo "Ejecutando condor_submit_dag"
condor_submit_dag historyXML2CSV.dag
