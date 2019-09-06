#!/usr/bin/env bash
#
# En este archivo el usuario debe indicar en la variable ${CURRENT_DIR} donde 
# quedaron instalados los archivos y programas para ejecutar el DAG que 
# convierte un archivo XML generado por 'condor_history -xml' a CSV.
#
# Este script es invocado por el script 'crontab-script'. 
# La razon por la cual esta variable se debe inicializar es porque el programa
# 'crontab-script' se asume sera invocado como una tarea del crontab y una tarea
# lanzada desde el cron tiene como directorio base el directorio ${HOME} de 
# quien definio la tarea en el cron.
#
# Esta variable debe ser cambiada dependiendo del directorio donde se instale 
# el software.
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Date: 2019-09-05
#
CURRENT_DIR="/cluster/condor/vagrant/_extract"
