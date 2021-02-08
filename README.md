# gpsql
## Premessa
Questo script permette la gestione di database Postgresql in ambiente shell includendo una svariata serie di comandi in psql.
Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.

## Installazione per Debian or Ubuntu Linux
```
$ sudo apt-get update
$ sudo apt-get install l dialog
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_linux_amd64
$ chmod +x pgfutter
$ ./gpsql
```

## Installazione per Mac OSX
```
$ brew install dialog
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_darwin_amd64
$ chmod +x pgfutter
$ gpsql
````
