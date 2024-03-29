#!/usr/bin/env bash
#CURRENT_DIR=$(pwd)
CURRENT_DATE=$( date +'%s' )
CURRENT_DIR="/cluster/condor/vagrant/_extract"
LOGFILE="${CURRENT_DIR}/logfile.log"
echo "[${CURRENT_DATE}] A punto de ejecutar '${CURRENT_DIR}/prepararEntornoExe.sh'" >> ${LOGFILE}
SALIDA=$( ${CURRENT_DIR}/prepararEntornoExe )
DIR=$(echo ${SALIDA} | cut -d '[' -f 2 | cut -d ']' -f 1)
echo "[${CURRENT_DATE}] Yendo a directorio ${CURRENT_DIR}/${DIR}" >> ${LOGFILE}
cd ${CURRENT_DIR}/${DIR}
echo "[${CURRENT_DATE}] Ejecutando condor_submit_dag" >> ${LOGFILE} 
condor_submit_dag historyXML2CSV.dag
if [ ! $? -eq 0 ]; then
	echo "[${CURRENT_DATE}] Error al someter tarea" >> ${LOGFILE} 
	exit -1
fi

