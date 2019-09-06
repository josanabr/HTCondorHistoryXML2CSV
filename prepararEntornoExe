#!/bin/bash
#
# Este script se encarga de preparar el entorno de ejecucion para procesar
# un archivo XML a CSV
#
# Author: John Sanabria
# Date: 2017-12-12
#
dirDestino=$(date +"%Y-%m-%d")
dir="$(pwd)" date=${dirDestino} ./historyXML2CSV.dag.template > historyXML2CSV.dag
dir="$(pwd)" date=${dirDestino} ./sFlatCondorXML.condor.template > sFlatCondorXML.condor
dir="$(pwd)" date=${dirDestino} ./_extract.condor.template > _extract.condor
dir="$(pwd)" date=${dirDestino} ./processingHistory.sh.template > processingHistory.sh
dir="$(pwd)" date=${dirDestino} ./processingHistory.condor.template > processingHistory.condor
chmod +x processingHistory.sh
declare -a archivosMV=("historyXML2CSV.dag" "sFlatCondorXML.condor" "_extract.condor" "processingHistory.sh" "processingHistory.condor")
declare -a archivosCP=("processingHistory.py" "_extract.py" "generarHistory.sh" "borrarArchivo.sh" "_extract.sh" "flatCondorXML.sh" "sFlatCondorXML.sh")
mkdir ${dirDestino}
# Archivos a mover. Son aquellos generados por el script
for i in "${archivosMV[@]}"; do
  mv ${i} ${dirDestino}
done
#mv history.xml ${dirDestino}/history-${dirDestino}.xml
# Archivos a copiar. Son aquellos archivos nucleo que no se puede borrar 
for i in "${archivosCP[@]}"; do
  cp ${i} ${dirDestino}
done
echo "En el directorio [${dirDestino}] se encuentran los archivos para su ejecucion"
