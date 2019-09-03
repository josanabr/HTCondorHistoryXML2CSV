#!/usr/bin/env python
#
# Este script se encarga de procesar el archivo CSV y entrega informacion 
# relativa a:
# - Numero de tareas procesasdas
# - Numero de taras exitosamente procesadas
# - Tiempo que se invirtio en procesar las tareas correctas
#
# Author: John Sanabria
# Fecha: 19-08-2019
#

import pandas as pd
import sys
from math import modf
from datetime import date

#
# Definicion de funciones
#
def secondsToString(seconds):
    deno = (60*60*24*365)
    answer = modf(seconds / deno)
    year = answer[1]
    months = answer[0]*12
    month = modf(months)[1]
    day = int(modf(months)[0]*30)
    #return "%d-%d-%d"%(day,month,year)
    return (day,int(month),int(year))

#
# Inicio del script
#
if (len(sys.argv) != 2):
    print("Requires one filename as argument")
    sys.exit(-1)
filename = sys.argv[1]
# Se lee el archivo con el historial
df = pd.read_csv(filename)
print("Total_Jobs %d"%df.shape[0])
#okJobs = df.loc[((df.LastJobStatus == 2) | (df.LastJobStatus == 6)) & df.JobStatus == 4]
okJobs = df.loc[df.JobStatus == 4]
print("Total_OK_Jobs %d"%okJobs.shape[0])
print("Total_FAIL_Jobs %d"%(df.shape[0] - okJobs.shape[0]))
failJobs = df.loc[df.JobStatus != 4] 
# totalSecEffComp: total seconds of effective computation
totalSecEffComp = okJobs['CompletionDate'].sum()-okJobs['JobCurrentStartDate'].sum()
total = secondsToString(totalSecEffComp)
print("Total_OK_Jobs_Year %d"%total[2])
print("Total_OK_Jobs_Month %d"%total[1])
print("Total_OK_Jobs_Day %d"%total[0])
print("Fecha_Inicio %s"%date.fromtimestamp(df['CompletionDate'].gt(0).min()))
