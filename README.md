# Convirtiend history XML de HTCondor a CSV

El comando `condor_history -xml` le permite a un administrador de un sistema HTCondor saber cuando y cuantas tareas han sido lanzadas en su ambiente de ejecución.
El informe de las salidas va en formato XML pero en un XML no bien formado.

Debido a esto se hace necesario un tratamiento especial del archivo generado y su posterior análisis. 
En este repositorio se crearon una serie de scripts que permiten generar el conjunto de archivos que convierten la salida del comando `condor_history -xml` a un archivo CSV que se puede procesar con librerías como Pandas. 

En este [repositorio](https://github.com/josanabr/visualizingUVClusterData) hay un ejemplo de como usar el archivos CSV generado por estos scripts.

# Ejecución

Para ejecutar este aplicativo se invoca el comando `./prepararEntornoExe.sh`.
Este comando, después de su ejecución, muestra por pantalla lo siguiente:

```
En el directorio [2019-09-03] se encuentran los archivos para su ejecucion
```

Una vez ejecutado el comando, entonces, deberá existir un directorio llamado `2019-09-03`.
Para obtener el archivo CSV se ejecuta lo siguiente:

```
cd 2019-09-03
condor_submit_dag historyXML2CSV.dag
```

# Ejecución en CRON

Esta tarea de extraer el archivo XML del `condor_history` se lleva a cabo en la Universidad del Valle una vez al mes. 
Para ello se programa una tarea en el crontab como sigue:

```
0 8 3 * * /cluster/condor/vagrant/_extract/crontab-script.sh
```

A las 8 de la mañana (GMT) del tercer día de todo mes se ejecutará el script `/cluster/condor/vagrant/_extract/crontab-script.sh`.
