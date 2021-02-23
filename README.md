# gpsql
## Premessa
Questo script permette la gestione di database Postgresql in ambiente shell includendo una svariata serie di comandi in psql.
Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.
E' tuttavia necessario aver già in precedenza installato e configurato Postgresql sul sistema operativo.

NB: per il sistema operativo Windows 10 è necessario abilitare la bash di Windows, ad esempio (https://www.lffl.org/2016/08/guida-abilitare-la-bash-windows-10.html)

## Installazione per Debian or Ubuntu Linux
```
$ sudo apt-get update && sudo apt-get upgrade
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/Marcuzzo77/gpsql.git
$ sudo apt-get install -y dialog
$ sudo apt-get update
$ sudo apt-get install l dialog
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_linux_amd64
$ chmod +x pgfutter
$ echo "export PATH="$PATH:$HOME/bin/gpsql"" >> .bashrc
$ cd gpsql
$ gpsql.sh
$ ./gpsql
```

## Installazione per Mac OSX
```
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/Marcuzzo77/gpsql.git
$ brew install dialog
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_darwin_amd64
$ chmod +x pgfutter
$ echo 'export PATH="$PATH:$HOME/bin/gpsql"' >> .bashrc
$ cd gpsql
$ gpsql.sh
$ gpsql
````

## Installazione per Windows 10
```
$ sudo apt-get update && sudo apt-get upgrade
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/Marcuzzo77/gpsql.git
$ sudo apt-get install -y dialog
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_linux_amd64
$ chmod +x pgfutter
$ echo 'export PATH="$PATH:$HOME/bin/gpsql"' >> .bashrc
$ cd gpsql
$ gpsql.sh
```
