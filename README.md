# gpsql
## Premessa
Questo script permette la gestione di database Postgresql in ambiente shell includendo una svariata serie di comandi psql.
<<<<<<< HEAD
Questo script permette la gestione di database Postgresql in ambiente shell includendo una svariata serie di comandi in psql.
Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.
E' tuttavia necessario aver già in precedenza installato e configurato Postgresql sul sistema operativo.

NB: per il sistema operativo Windows 10 è necessario abilitare la bash di Windows, qui una delle tante guide che si trovano in rete (https://www.lffl.org/2016/08/guida-abilitare-la-bash-windows-10.html)
=======
Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.
E' tuttavia necessario aver già in precedenza installato e configurato Postgresql sul sistema operativo.
>>>>>>> parent of fe59d20... update gpsql.sh

NB: per il sistema operativo Windows 10 è necessario abilitare la bash di Windows, qui una delle tante guide che si trovano in rete (https://www.lffl.org/2016/08/guida-abilitare-la-bash-windows-10.html)

## Installazione per Debian o Ubuntu Linux
```
$ sudo apt-get update && sudo apt-get upgrade
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/Marcuzzo77/gpsql.git
$ sudo apt-get install -y dialog
<<<<<<< HEAD
$ sudo apt-get update
$ sudo apt-get install l dialog
=======
>>>>>>> parent of fe59d20... update gpsql.sh
$ wget -O pgfutter https://github.com/lukasmartinelli/pgfutter/releases/download/v1.2/pgfutter_linux_amd64
$ chmod +x pgfutter
$ echo "export PATH="$PATH:$HOME/bin/gpsql"" >> .bashrc
$ cd gpsql
$ gpsql.sh
<<<<<<< HEAD
$ ./gpsql
=======
>>>>>>> parent of fe59d20... update gpsql.sh
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
<<<<<<< HEAD
$ gpsql
=======
>>>>>>> parent of fe59d20... update gpsql.sh
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
