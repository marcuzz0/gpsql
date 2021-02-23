#!/bin/bash
#
# versione 1.0 creata da MSeverin in data 31/01/2021
#########################################################################################
# VARIABILI DI CONNESSIONE
#########################################################################################
BTITLE="GESTIONE PSQL 1.0 by MSeverin"
HOST="localhost"
PORT="5432"
USER="admin"
DATABASE="test"
SCHEMA="test"
EPSG="4326"
EPSG1="4326"
EPSG2="32633"
PATH_DIR="$HOME/psql"
PATH_FILE="$HOME/psql"
PATH_DUMP="$HOME/psql"
PATH_RESTORE="$HOME/file/*.sql"
NEW_TABLE="nuova_tabella"
SI="s"

#########################################################################################
# VARIABILI DI FORMATTAZIONE
#########################################################################################
sottolineato=$(tput smul)     # attiva il sottolineato
nonsottolineato=$(tput rmul)  # disattiva il sottolineato
grassetto=$(tput bold)        # attiva il grassetto
inverso=$(tput rev)           # attiva la modalità inversa
normale=$(tput sgr0)          # annulla tutti gli effetti e torna al default
txtrosso=$(tput setaf 1)      # carattere rosso
txtverde=$(tput setaf 2)      # carattere verde
txtgiallo=$(tput setaf 3)     # carattere giallo
txtblu=$(tput setaf 4)        # carattere blu
txtporpora=$(tput setaf 5)    # carattere porpora
txtciano=$(tput setaf 6)      # carattere ciano (azzurro)
txtbianco=$(tput setaf 7)     # carattere bianco
txtsforosso=$(tput setab 1)   # sfondo carattere rosso
txtsfoverde=$(tput setab 2)   # sfondo carattere verde
txtsfogiallo=$(tput setab 3)  # sfondo carattere giallo
txtsfoblu=$(tput setab 4)     # sfondo carattere blu
txtsfoporpora=$(tput setab 5) # sfondo carattere porpora
txtsfociano=$(tput setab 6)   # sfondo carattere ciano (azzurro)
txtsfobianco=$(tput setab 7)  # sfondo carattere bianco

#########################################################################################
# FUNZIONI DI CONNESSIONE
#########################################################################################
HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
		read -s
		if [[ $REPLY ]]; then
			PASSWORD=$REPLY
		fi
		echo "    "

    read -p "${grassetto}${txtverde}-->${normale} Imposta EPSG di partenza (default $EPSG1): "
		if [[ $REPLY ]]; then
			EPSG1=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$EPSG1${normale}"

    read -p "${grassetto}${txtverde}-->${normale} Imposta EPSG di destinazione (default $EPSG2): "
		if [[ $REPLY ]]; then
			EPSG2=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$EPSG2${normale}"

    read -p "${grassetto}${txtverde}-->${normale} Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"

    read -p "${grassetto}${txtverde}-->${normale} Imposta il nome della tabella di destinazione (default $NEW_TABLE): "
		if [[ $REPLY ]]; then
			NEW_TABLE=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$NEW_TABLE${normale}"

}
HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo "    "

		echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta EPSG (default $EPSG): "
		if [[ $REPLY ]]; then
			EPSG=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$EPSG${normale}"

    read -p "${grassetto}${txtverde}-->${normale} Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"
}
HOST,PORT,USER,PASSWORD,PATH_DIR () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo "    "

		echo ""
    read -p "${grassetto}${txtverde}-->${normale} Imposta il path della directory: (default $PATH_DIR): "
		if [[ $REPLY ]]; then
			PATH_DIR=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_DIR${normale}"

}
HOST,PORT,USER,PASSWORD,PATH_FILE () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo "    "

    read -p "${grassetto}${txtverde}-->${normale} Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"

}
HOST,PORT,USER,PASSWORD,PATH_DUMP () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo "    "

		read -p "${grassetto}${txtverde}-->${normale} Imposta il path di destinazione (default $PATH_DUMP): "
		if [[ $REPLY ]]; then
			PATH_DUMP=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_DUMP${normale}"

}
HOST,PORT,USER,PASSWORD,PATH_RESTORE () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

		echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD : "
		read -s
		if [[ $REPLY ]]; then
			PASSWORD=$REPLY
		fi
		echo "    "

		read -p "${grassetto}${txtverde}-->${normale} Imposta il path con il file di partenza (default $PATH_RESTORE): "
		if [[ $REPLY ]]; then
			PATH_RESTORE=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PATH_RESTORE${normale}"

}
HOST,PORT,USER,PASSWORD () {

		# echo `date`
		# echo ""
		read -p "${grassetto}${txtverde}-->${normale} Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$HOST${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$PORT${normale}"

		read -p "${grassetto}${txtverde}-->${normale} Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo "    ${grassetto}${txtverde}$USER${normale}"

    echo -n "${grassetto}${txtverde}-->${normale} Imposta PASSWORD: "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""
}

#########################################################################################
# FUNZIONI DI DIALOGO RICORSIVE
#########################################################################################
Aggiungi_colonna () {

				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "SELECT * from $VAR1.$VAR2"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome della colonna da aggiungere: "
			echo ""
			read VAR3
			echo ""
				 PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c \
			 "ALTER TABLE $VAR1.$VAR2 ADD $VAR3 text;"
			read -p "${grassetto}${txtverde}-->${normale} Vuoi vedere il contenuto della tabella? (s/n) (default $SI): "
				 if [[ $REPLY ]]; then
					 SI=$REPLY
				 fi
				 # echo $SI
				 clear
					 if [ $SI = "s" ]; then
						 PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "SELECT * from $VAR1.$VAR2"
					 else
						 gpsql.sh
					 fi
}
Cancella_colonna () {

				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "SELECT * from $VAR1.$VAR2"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome della colonna da cancellare: "
			echo ""
			read VAR3
			echo ""
				 PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c \
			 "ALTER TABLE $VAR1.$VAR2 DROP COLUMN $VAR3"
			read -p "${grassetto}${txtverde}-->${normale} Vuoi vedere il contenuto della tabella? (s/n) (default $SI): "
				 if [[ $REPLY ]]; then
					 SI=$REPLY
				 fi
				 # echo $SI
				 clear
					 if [ $SI = "s" ]; then
						 PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "SELECT * from $VAR1.$VAR2"
					 else
						 gpsql.sh
					 fi
			}

#########################################################################################
clear

HEIGHT=17
WIDTH=35
CHOICE_HEIGHT=17
BACKTITLE="$BTITLE"
TITLE="Menù Principale"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Gestione database"
2 "Gestione schemi"
3 "Gestione tabelle"
4 "Gestione utenti"
5 "Gestione gruppi"
6 "Gestione raster"
7 "Gestione shapefile"
8 "Gestione privilegi"
9 "Esci")

choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

1)	clear

HEIGHT=15
WIDTH=35
CHOICE_HEIGHT=15
BACKTITLE="$BTITLE"
TITLE="Gestione database"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista dei database"
2 "Crea database"
3 "Cancella database"
4 "Dump database"
5 "Restore database"
6 "Lista estensioni"
7 "Menù principale"
)
choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

	1)	clear
			echo ""
			echo -e "${txtsfoblu}Lista dei database"
			echo -e "${normale}Questo tool permette di visionare la lista dei database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
      	gpsql.sh
			;;

	2)	clear
			echo ""
			echo -e "${txtsfoblu}Crea database"
			echo -e "${normale}Questo tool permette di creare un database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
     		PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
      echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del database da creare: "
      echo ""
      read VAR
			read -p "${grassetto}${txtverde}-->${normale} Vuoi creare anche l'estensione postgis? (s/n) (default $SI): "
				if [[ $REPLY ]]; then
					SI=$REPLY
				fi
			#echo $SI
				if [ $SI = "s" ]; then
					PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d postgres -c "create database $VAR"
					PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR -c "create extension postgis"
				elif [ $SI != "n" ]; then
				clear
				echo ""
				echo -n "Scelta invalida... "
			echo ""
			sleep 1
				gpsql.sh
				fi
      sleep 1
      clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
      	gpsql.sh
      ;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella database"
			echo -e "${normale}Questo tool permette di cancellare un database"
			echo ""
				HOST,PORT,USER,PASSWORD
      clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
    	echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del database da cancellare:  "
      echo ""
      read VAR
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d postgres << EOF
					SELECT pg_terminate_backend(pg_stat_activity.pid)
					FROM pg_stat_activity
					WHERE pg_stat_activity.datname = '$VAR';
					\q
EOF
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "drop database $VAR"
      sleep 1
      clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
      	gpsql.sh
      ;;

  4)	clear
			echo ""
			echo -e "${txtsfoblu}Dump database"
			echo -e "${normale}Questo tool permette di eseguire un backup del database scelto"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_DUMP
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del database per il dump: "
			echo ""
			read VAR
				PGPASSWORD="$PASSWORD" pg_dump -U $USER -h $HOST -p $PORT $VAR > $PATH_DUMP/$VAR.sql
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
		  echo ""
			read
				gpsql.sh
			;;

  5)  clear
			echo ""
	 		echo -e "${txtsfoblu}Restore database"
	 		echo -e "${normale}Questo tool permette di ripristinare un backup a partire da un file"
			echo ""
		 		HOST,PORT,USER,PASSWORD,PATH_RESTORE
		  clear
		 		PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
		 	echo ""
		 	echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del database per il restore: "
		 	echo ""
		 	read VAR
		 	 	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -c "create database $VAR"
		 	 	PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR < $PATH_RESTORE
			sleep 1
		 	clear
	 		 	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
		 	echo ""
		 	echo -n "Premi un tasto per tornare al menù principale... "
	 	 	echo ""
			read
			 	gpsql.sh
			;;

  6)  clear
			echo ""
			echo -e "${txtsfoblu}Lista estensioni"
			echo -e "${normale}Questo tool permette di verificare le estensioni presenti in un database"
			echo ""
			 	HOST,PORT,USER,PASSWORD
			clear
			  PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del database per verificare le estensioni installate: "
			echo ""
			read VAR
		  sleep 1
			clear
				 PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR -c "\dx"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
	  		gpsql.sh
			;;

	7)  	gpsql.sh
			;;
esac
;;

2)	clear

HEIGHT=12
WIDTH=35
CHOICE_HEIGHT=12
BACKTITLE="$BTITLE"
TITLE="Gestione schemi"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista degli schemi"
2 "Crea schema"
3 "Cancella schema"
4 "Menù principale"
)
choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

	1)	clear
			echo ""
			echo -e "${txtsfoblu}Lista degli schemi"
			echo -e "${normale}Questo tool permette di visionare la lista degli schemi presenti in un database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
      echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome del database sul quale visionare gli schemi associati:  "
      echo ""
      read VAR
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR -h $HOST -p $PORT -c "\dn"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
			read
        gpsql.sh
      ;;

  2) 	clear
			echo ""
			echo -e "${txtsfoblu}Crea schema"
			echo -e "${normale}Questo tool permette di creare uno schema presente in un database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
  		echo ""
			echo -n "${grassetto}${txtverde}-->${normale} In quale database vuoi creare lo schema?  "
  		echo ""
      read VAR0
    	clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
  		echo ""
    	echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome dello schema da creare:  "
    	echo ""
      read VAR1
      	PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1;"
      sleep 1
    	clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
      echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
      ;;

	3)  clear
			echo ""
			echo -e "${txtsfoblu}Cancella schema"
			echo -e "${normale}Questo tool permette di cancellare uno schema presente in un database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} In quale database vuoi cancellare lo schema?  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome dello schema da cancellare:  "
			echo ""
			read VAR1
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "drop schema $VAR1 cascade"
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	4)   gpsql.sh
			;;
esac
;;

3)	clear

HEIGHT=20
WIDTH=38
CHOICE_HEIGHT=20
BACKTITLE="$BTITLE"
TITLE="Gestione tabelle"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista delle tabelle"
2 "Crea tabella"
3 "Crea tabella da *.sql"
4 "Crea tabella da *.csv"
5 "Cancella tabella"
6 "Esporta dati in *.csv"
7 "Esporta query su file"
8	"Aggiungi colonna"
9 "Cancella colonna"
10 "Dump tabella"
11 "Restore tabella"
12 "Menù principale"
)
choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

	1)	clear
			echo ""
			echo -e "${txtsfoblu}Lista delle tabelle"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database:  "
			echo ""
			read VAR0
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			read -p "${grassetto}${txtverde}-->${normale} Vuoi vedere il contenuto della tabella? (s/n) (default $SI): "
				if [[ $REPLY ]]; then
					SI=$REPLY
				fi
				# echo $SI
					if [ $SI = "s" ]; then
						echo ""
						echo -n "Inserisci il nome della tabella:  "
						echo ""
						read VAR2
						clear
					  PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "SELECT * from $VAR1.$VAR2"
					else
						gpsql.sh
					fi
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	2)  clear
			echo ""
			echo -e "${txtsfoblu}Crea tabella"
			echo -e "${normale}Questo tool permette di generare una tabella veloce inserendo a mano i campi"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} In quale database vuoi creare la tabella?  "
			echo ""
			read VAR1
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome dello schema a cui associare la tabella da creare:  "
			echo ""
			read VAR2
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dt $VAR2.*"
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "create schema $VAR2;"

			echo ""
   		echo -e "${grassetto}${txtverde}-->${normale} Scrivi il nome della ${txtsfoverde}tabella${normale} da creare:"
			read VAR3
			echo ""
   		echo -e "${grassetto}${txtverde}-->${normale} Quante ${txtsfoverde}colonne${normale} vuoi creare:"
			read VAR4
				count=1
					while [ $count -le $VAR4 ]
					do
							read -p "${grassetto}${txtverde}-->${normale} Inserisci il nome della colonna $count:" VAR5
								arrey[$count-1]=$VAR5
								count=$(( $count +1 ))
					done
				VAR6=`(IFS=,; echo "(${arrey[*]})")`
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "create table $VAR2.$VAR3$VAR6"
			sleep 1
			clear
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Crea tabella da *.sql"
			echo -e "${normale}Questo tool permette di generare una tabella a partire da un file *.sql"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_FILE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database:  "
			echo ""
			read VAR0
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
					alter role $USER in database $VAR0 set search_path to $VAR1,public;
					\q
EOF
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "show search_path"
			sleep 1
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -f $PATH_FILE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c \
				"SELECT grantee, table_schema, table_name FROM information_schema.role_table_grants WHERE table_schema = '$VAR1' AND grantee = '$USER' "
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	4)  clear
			echo ""
			echo -e "${txtsfoblu}Crea tabella da *.csv"
			echo -e "${normale}Questo tool permette di generare una tabella a partire da un file *.csv. Si può:"
			echo ""
			echo -e "1- ${grassetto}${txtverde}importare un file con geometria (Lat,Lon,Hei)${normale} il quale verrà generato nel database"
			echo -e	"   in (id,Lat,Lon,Hei,geom) tenendo conto che il file deve avere presente un header Lat,Lon,Hei"
			echo -e "2- ${grassetto}${txtverde}importare un file con geometria${normale} indistintamente dai campi, il quale verrà generato nel database"
			echo -e	"   tenendo conto che il file deve avere presente un header"
			echo -e "3- ${grassetto}${txtverde}importare un file senza geometria${normale} indistintamente dai campi, il quale verrà generato nel database"
			echo -e	"   tenendo conto che il file deve avere presente un header"
			echo -e ""
			echo -e	"${grassetto}${txtrosso}(NB: è necessario aver precedentemente installato il tool ${sottolineato}pgfutter${normale}${grassetto}${txtrosso})${normale} "
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli un'opzione (1 - 3): "
			echo ""
			read -p "" choice

			case $choice in

			1)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv con geometria (Lat,Lon,Hei)${normale}"
					echo ""
						HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
					clear
					PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "${grassetto}${txtverde}-->${normale} A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					sleep 1
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
					./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table temp --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR1.temp ADD COLUMN id SERIAL PRIMARY KEY;
							ALTER TABLE $VAR1.temp ALTER COLUMN id type integer USING (id::integer);
							ALTER TABLE $VAR1.temp ADD COLUMN geom geometry(Point,$EPSG);
							UPDATE $VAR1.temp SET geom=ST_SetSRID(ST_MakePoint(lon::double precision,lat::double precision),$EPSG);
							CREATE VIEW $VAR1.temp1 AS SELECT id,lat,lon,hei,geom from $VAR1.temp;
							CREATE TABLE $VAR1.$VAR2 as (select * from $VAR1.temp1);
							DROP TABLE IF EXISTS $VAR1.temp CASCADE;
EOF
					sleep 2
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					;;

			2)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv con geometria ${normale}"
					echo ""
						HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "${grassetto}${txtverde}-->${normale} A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					sleep 1
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
						./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table $VAR2 --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR1.$VAR2 ADD COLUMN id integer SERIAL PRIMARY KEY;
							ALTER TABLE $VAR1.$VAR2 ALTER COLUMN id type integer USING (id::integer);
							ALTER TABLE $VAR1.$VAR2 ADD COLUMN geom geometry(Point,$EPSG);
							UPDATE $VAR1.$VAR2 SET geom=ST_SetSRID(ST_MakePoint(lon::double precision,lat::double precision),$EPSG);
EOF
					sleep 2
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					;;

			3)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv senza geometria${normale}"
					echo ""
						HOST,PORT,USER,PASSWORD,PATH_FILE
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "${grassetto}${txtverde}-->${normale} A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					sleep 1
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
					./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table $VAR2 --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR1.$VAR2 ADD COLUMN id integer SERIAL PRIMARY KEY;
							ALTER TABLE $VAR1.$VAR2 ALTER COLUMN id type integer USING (id::integer);
EOF
					sleep 2
					clear
						#PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					;;

     *)   	gpsql.sh
					;;
					esac
					;;


	5)  clear
			echo ""
			echo -e "${txtsfoblu}Cancella tabella"
			echo -e "${normale}Questo tool permette di cancellare una tabella presente in un"
			echo -e "database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} In quale database vuoi cancellare la tabella?  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome dello schema a cui cancellare la tabella associata:  "
			echo ""
			read VAR2
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dt $VAR2.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome della tabella da cancellare:  "
			echo ""
			read VAR3
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "drop table $VAR2.$VAR3 cascade"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

 6)  	clear
	  	echo ""
			echo -e "${txtsfoblu}Esporta dati in *.csv"
			echo -e "${normale}Questo tool permette di esportare una tabella in formato *.csv presente in un"
			echo -e "database con la scelta del delimitatore"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_DIR
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella da esportare: "
			echo ""
			read VAR2
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il nome del file in uscita: "
			echo ""
			read VAR3
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il delimitatore: "
			echo ""
			read VAR4
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c \
				"\copy $VAR1.$VAR2 to $PATH_DIR/$VAR3.csv DELIMITER '$VAR4' CSV HEADER;"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

 7)  	clear
			echo ""
			echo -e "${txtsfoblu}Esporta query su file"
			echo -e "${normale}Questo tool permette di esportare la query dei campi di una tabella in"
			echo -e "formato *.txt presente in un database"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_FILE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella da esportare: "
			echo ""
			read VAR2
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
					\o $PATH_FILE;
					select * from $VAR1.$VAR2;
EOF
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
			gpsql.sh
			;;

 8)  	clear
 		 	echo ""
 	 		echo -e "${txtsfoblu}Aggiungi colonna"
 			echo -e "${normale}Questo tool permette di creare una nuova colonna in una tabella presente in un"
 			echo -e "database. Attualmente viene assocciato in automatico alla colonna una stringa di tipo testo."
 			echo ""
				HOST,PORT,USER,PASSWORD
 			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
 			echo ""
 			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
 			echo ""
 			read VAR0
 			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
 			echo ""
 			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
 			echo ""
 			read VAR1
 			clear
			PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
 			echo ""
 			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella a cui aggiungere la colonna: "
 			echo ""
 			read VAR2
 			clear
 		 		Aggiungi_colonna
			echo ""
 		 	read -p "${grassetto}${txtverde}-->${normale} Vuoi ripetere l'operazione? (s/n) (default $SI): "
				if [[ $REPLY ]]; then
					SI=$REPLY
				fi
		 			clear
					if [ $SI = "s" ]; then
						Aggiungi_colonna
					else
						gpsql.sh
				fi
		 	;;

	9)  clear
			echo ""
			echo -e "${txtsfoblu}Cancella colonna"
			echo -e "${normale}Questo tool permette di cancellare una colonna presente in una tabella"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella a cui cancellare la colonna: "
			echo ""
			read VAR2
			clear
				Cancella_colonna
			echo ""
			read -p "${grassetto}${txtverde}-->${normale} Vuoi ripetere l'operazione? (s/n) (default $SI): "
 				if [[ $REPLY ]]; then
 					SI=$REPLY
 				fi
 		  		clear
 					if [ $SI = "s" ]; then
 						Cancella_colonna
 				else
 						gpsql.sh
 				fi
			;;

 10)  clear
			echo ""
			echo -e "${txtsfoblu}Dump tabella"
			echo -e "${normale}Questo tool permette di fare un backup di una tabella in formato *.sql"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_DUMP
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
  		echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo tabella da dumpare: "
			echo ""
			read VAR2
			read -p "${grassetto}${txtverde}-->${normale} Vuoi dumpare solo i dati? (s/n) (default $SI): "
			if [[ $REPLY ]]; then
				SI=$REPLY
			fi
			# echo $SI
					if [ $SI = "s" ]; then
					  PGPASSWORD="$PASSWORD" pg_dump -U $USER -h $HOST -p $PORT -d $VAR0 --t $VAR1.$VAR2 \
						--verbose --column-inserts --data-only > $PATH_DUMP/$VAR2.sql
					elif [ $SI != "n" ]; then
						gpsql.sh
					else
						PGPASSWORD="$PASSWORD" pg_dump -U $USER -h $HOST -p $PORT -d $VAR0 --t $VAR1.$VAR2 \
						--verbose --column-inserts > $PATH_DUMP/$VAR2.sql
					fi
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
		  echo ""
			read
				gpsql.sh
			;;

	11)	clear
			echo ""
			echo -e "${txtsfoblu}Restore tabella"
			echo -e "${normale}Questo tool permette di fare un ripristino da un file in formato *.sql di una"
			echo -e "tabella per la successiva importazione in un database"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_RESTORE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
				#VAR1=`cat $PATH_RESTORE | awk 'NR==25 {print}' | awk -F'[ :;]' '{print $12}'`
				#cat $PATH_RESTORE | awk -F'[,]' '{print $1","$2","$3","$7","$12}' | awk 'NR>=9 && NR<=12 {print}'
				VAR1=`cat $PATH_RESTORE | awk '/CREATE TABLE/ {print}' | awk -F'[ .]' '{print $3}'`
			clear
			  #PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Creo lo schema da associare al restore dal file *.sql "
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -c "create schema $VAR1"
			sleep 1
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
					\echo
					\echo Creo l'estensione postgis se non presente
					CREATE EXTENSION IF NOT EXISTS postgis;
					--SELECT nspname
					--FROM pg_extension ext
					--INNER JOIN pg_namespace nsp
					--ON nsp.oid = ext.extnamespace
					--WHERE ext.extname = 'postgis';
EOF
			sleep 1
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -f $PATH_RESTORE
				#PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
				#PGPASSWORD="$PASSWORD" pg_restore -U $USER -d $VAR0 -h $HOST -p $PORT $PATH_RESTORE
				#PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 -f $PATH_RESTORE
			#sleep 1
			#clear
				#PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
	 			gpsql.sh
			;;

	12)		gpsql.sh
			;;
esac
;;

4)	clear

HEIGHT=15
WIDTH=38
CHOICE_HEIGHT=15
BACKTITLE="$BTITLE"
TITLE="Gestione utenti"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista degli utenti"
2 "Crea utente"
3 "Crea superutente"
4 "Cancella utente"
5 "Associa utente a gruppo"
6 "Menù principale"
)
choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

	1)	clear
			echo ""
			echo -e "${txtsfoblu}Lista degli utenti"
			echo -e "${normale}Questo tool permette di visionare la lista di tutti gli utenti presenti in un"
			echo -e "database"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	2)	clear
			echo ""
			echo -e "${txtsfoblu}Crea utente"
			echo -e "${normale}Questo tool permette di creare un utente semplice con nome utente e password"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome dell'utente da creare:  "
			echo ""
			read VAR
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi la password per il superutente da creare:  "
			echo ""
			read -s VAR1
			PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d postgres << EOF
				CREATE ROLE $VAR;
				ALTER ROLE $VAR login password '$VAR1';
EOF
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Crea superutente"
			echo -e "${normale}Questo tool permette di creare un superutente con nome utente, password e"
			echo -e "con la possibilità di creare database e ruoli"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del superutente da creare:  "
			echo ""
			read VAR
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi la password per il superutente da creare:  "
			echo ""
			read VAR1
			PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
				CREATE ROLE $VAR;
				ALTER ROLE $VAR login password '$VAR1' superuser createdb createrole replication;
EOF
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	4)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella utente"
			echo -e "${normale}Questo tool permette di cancellare un utente presente in un database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome dell'utente da cancellare:  "
			echo ""
			read VAR
			PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
				drop owned by $VAR;
				drop role $VAR;
EOF
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;


	5)	clear
			echo ""
			echo -e "${txtsfoblu}Associa utente a gruppo"
			echo -e "${normale}Questo tool permette di associare un utente ad un gruppo presente in un"
			echo -e "database"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del gruppo:  "
			echo ""
			read VAR1
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome dell'utente:  "
			echo ""
			read VAR2
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "grant $VAR1 to $VAR2"
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	6)		gpsql.sh
      ;;
esac
;;

5)	clear

HEIGHT=12
WIDTH=35
CHOICE_HEIGHT=12
BACKTITLE="$BTITLE"
TITLE="Gestione gruppi"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista dei gruppi"
2 "Crea gruppo"
3 "Cancella gruppo"
4 "Menù principale"
)
choice=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

case $choice in

	1)	clear
			echo ""
			echo -e "${txtsfoblu}Lista dei gruppi"
			echo -e "${normale}Questo tool permette di visionare la lista di tutti i gruppi presenti in un"
			echo -e "database"
			echo ""
				HOST,PORT,USER,PASSWORD
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
        gpsql.sh
		  ;;

	2)  clear
			echo ""
			echo -e "${txtsfoblu}Crea gruppo"
			echo -e "${normale}Questo tool permette di creare un gruppo"
			echo ""
				HOST,PORT,USER,PASSWORD
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del gruppo da creare:  "
      echo ""
      read VAR
	    	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "create group $VAR"
      sleep 1
			clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
      	gpsql.sh
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella gruppo"
			echo -e "${normale}Questo tool permette di cancellare un gruppo presente in un database"
			echo ""
				HOST,PORT,USER,PASSWORD
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "${grassetto}${txtverde}-->${normale} Scrivi il nome del gruppo da cancellare:  "
      echo ""
      read VAR
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "drop group $VAR"
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

 	4)  	gpsql.sh
      ;;
esac
;;

6)	clear
		echo ""
		echo -e "${txtsfoblu}Importa raster"
		echo -e "${normale}Questo tool permette di importare un file raster (*.tif) all'interno di in un"
		echo -e "database di uno specifico schema"
		echo ""
			HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
		clear
		echo ""
			PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
		echo ""
		echo -e "${grassetto}${txtverde}-->${normale} Scegli il database: "
		read VAR0
		clear
			PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
		echo ""
		echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema: "
		echo ""
		read VAR1
		clear
			#PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
		#echo ""
		#echo -e "Inserisci il nome della tabella da creare per l'import del raster: "
		#read VAR2
		#clear
		#sleep 1
		#clear
			raster2pgsql -I -C -d -s $EPSG $PATH_FILE $VAR1.`basename $PATH_FILE` \
			| PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT
    echo ""
    echo -n "Premi un tasto per tornare al menù principale... "
    echo ""
    read
      gpsql.sh
		;;

7)	clear

HEIGHT=11
WIDTH=35
CHOICE_HEIGHT=11
BACKTITLE="$BTITLE"
TITLE="Gestione shapefile"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Import shapefile"
2 "Export shapefile"
3 "Menù principale"
)
choice=$(dialog --clear \
								--backtitle "$BACKTITLE" \
								--title "$TITLE" \
								--menu "$MENU" \
								$HEIGHT $WIDTH $CHOICE_HEIGHT \
           			"${OPTIONS[@]}" \
           			2>&1 >/dev/tty)

case $choice in

	1)  clear
			echo ""
			echo -e "${txtsfoblu}Import shapefile"
			echo -e "${normale}Questo tool permette di creare una tabella per mezzo del comando shp2psql e di"
			echo -e "importarla in un database"
			echo ""
				HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci o crea lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			# echo ""
			# echo -n "Inserisci il nome della tabella:  "
			# echo ""
			# read VAR2
			clear
			sleep 1
				shp2pgsql -I -s $EPSG1:$EPSG2 $PATH_FILE $VAR1.$NEW_TABLE | PGPASSWORD="$PASSWORD" psql -d $VAR0 -U $USER -h $HOST -p $PORT
			#ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL PG:" dbname='$VAR0' host=$HOST port=$PORT \
			#user='$USER' password='$PASSWORD' active_schema=$VAR1 " -lco DIM=2 $PATH_FILE \
			#$VAR2 -overwrite -nlt GEOMETRY -lco GEOMETRY_NAME=geom -lco FID=id -nln $VAR2.$VAR2 -t_srs EPSG:$EPSG1 -a_srs EPSG:$EPSG2 \
			#-nlt PROMOTE_TO_MULTI
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

  2)  clear
			echo ""
			echo -e "${txtsfoblu}Export shapefile"
			echo -e "${normale}Questo tool permette di esportare in formato *.shp una tabella presente "
			echo -e "in un database specificandone il nome in uscita"
			echo ""
				HOST,PORT,USER,PASSWORD,PATH_DIR
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella da esportare:  "
			echo ""
			read VAR2
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il nome del file *.shp in uscita:  "
			echo ""
			read VAR3
			sleep 1
			clear
				pgsql2shp -f $PATH_DIR/$VAR3'.shp' -u $USER -h $HOST -p $PORT -P $PASSWORD $VAR0 $VAR1.$VAR2
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

  3)  	gpsql.sh
			;;
esac
;;

8)	clear

HEIGHT=13
WIDTH=35
CHOICE_HEIGHT=13
BACKTITLE="$BTITLE"
TITLE="Gestione privilegi"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Privilegi a tabella"
2 "Privilegi a vista"
3 "Assegna ad utente"
4 "Assegna a gruppo"
5 "Menù principale"
)
choice=$(dialog --clear \
								--backtitle "$BACKTITLE" \
								--title "$TITLE" \
								--menu "$MENU" \
								$HEIGHT $WIDTH $CHOICE_HEIGHT \
           			"${OPTIONS[@]}" \
           			2>&1 >/dev/tty)

case $choice in

	1)  clear
			echo ""
			echo -e "${txtsfoblu}Privilegi a tabella"
			echo -e "${normale}Questo tool permette di conoscere i privilegi dei vari utenti su una tabella"
			echo -e ""
				HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Scegli la tabella:  "
			echo ""
			read VAR2
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
					set search_path to $VAR1;
					\! clear
					select a.tablename,b.usename,HAS_TABLE_PRIVILEGE(usename,tablename, 'select') as select,
			  	HAS_TABLE_PRIVILEGE(usename,tablename, 'insert') as insert,
			  	HAS_TABLE_PRIVILEGE(usename,tablename, 'update') as update,
			  	HAS_TABLE_PRIVILEGE(usename,tablename, 'delete') as delete,
			  	HAS_TABLE_PRIVILEGE(usename,tablename, 'references') as references  from pg_tables a , pg_user b
					where a.tablename='$VAR2';
EOF
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

 2)   clear
			echo ""
			echo -e "${txtsfoblu}Privilegi a vista"
			echo -e "${normale}Questo tool permette di conoscere i privilegi dei vari utenti su una vista"
			echo ""
				HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "${grassetto}${txtverde}-->${normale} Inserisci o crea lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
			sleep 1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			clear
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Assegna ad utente"
			echo -e "${normale}Questo tool permette associare ad un utente dei permessi o privilegi di "
			echo -e "SELECT,INSERT,UPDATE,DELETE"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome del database:"
			read DATABASE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\dn"
			echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome dello schema:"
			read SCHEMA
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo -e "${grassetto}${txtverde}-->${normale} Inserisci il nome del nuovo utente:"
			read NEW_USER
			echo -e "${grassetto}${txtverde}-->${normale} Inserisci la password per il nuovo utente:"
			read NEW_PSW
			clear
			echo ""
			echo -e "${grassetto}${txtverde}-->${normale} Scegli i permessi (SELECT,INSERT,UPDATE,DELETE):"
			read PRIVILEGI
			clear
			echo ""
			echo -e "${grassetto}${txtverde}-->${normale} Vuoi (c)oncedere o (r)evocare i permessi?"
			read choice

		case $choice in

			c)	clear
					echo ""
					echo -e "Riassunto delle operazioni:"
					echo ""
					echo -e " - ${txtgiallo}Crea ${normale}un nuovo utente ${txtverde}$NEW_USER ${normale}con permessi di ${txtverde}$PRIVILEGI"
					echo -e " - ${txtverde}Concedi ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}${txtverde}$PRIVILEGI ${normale}su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le sequenze sullo schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo sullo schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtciano}Modifica ${normale}i privilegi predefiniti nello schema ${txtverde}$SCHEMA ${normale}concedendo ${txtverde}$PRIVILEGI ${normale}sulle tabelle a ${txtverde}$NEW_USER"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Premi un tasto per procedere..."
					read
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
							CREATE ROLE $NEW_USER;
							ALTER ROLE $NEW_USER login password '$NEW_PSW';
							GRANT CONNECT ON DATABASE $DATABASE TO $NEW_USER;
							revoke CONNECT on DATABASE $DATABASE from PUBLIC;
							grant USAGE on SCHEMA $SCHEMA to $NEW_USER;
							revoke ALL on ALL tables in schema public from PUBLIC;
							revoke ALL on ALL tables in schema $SCHEMA from PUBLIC;
							grant $PRIVILEGI on ALL tables in schema $SCHEMA to $NEW_USER;
							revoke ALL on ALL sequences in schema public from PUBLIC;
							revoke ALL on ALL sequences in schema $SCHEMA from PUBLIC;
							grant SELECT on ALL sequences in schema $SCHEMA to $NEW_USER;
							grant USAGE on ALL sequences in schema $SCHEMA to $NEW_USER;
							grant USAGE on schema public to $NEW_USER;
							grant SELECT on ALL tables in schema public to $NEW_USER;
							alter default privileges in schema $SCHEMA grant $PRIVILEGI on tables to $NEW_USER;
							select pg_sleep(3);
							\! clear
							\echo
							\du;
							\echo
							SELECT grantee, table_schema, table_name, privilege_type
							FROM information_schema.role_table_grants
							WHERE table_schema = '$SCHEMA' AND grantee = '$NEW_USER';
EOF
					echo ""
		      echo -n "Premi un tasto per tornare al menù principale... "
		      echo ""
		      read
		        gpsql.sh
					;;


			r)	clear
					echo ""
					echo -e "Riassunto delle operazioni:"
					echo ""
					echo -e " - ${txtgiallo}Crea ${normale}un nuovo utente ${txtverde}$NEW_USER ${normale}con permessi di ${txtverde}$PRIVILEGI"
					echo -e " - ${txtverde}Concedi ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}${txtverde}$PRIVILEGI ${normale}su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}$NEW_USER"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le sequenze sullo schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo sullo schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_USER"
					echo -e " - ${txtciano}Modifica ${normale}i privilegi predefiniti nello schema ${txtverde}$SCHEMA ${normale}revocando ${txtverde}$PRIVILEGI ${normale}sulle tabelle da ${txtverde}$NEW_USER"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Premi un tasto per procedere..."
					read
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
							CREATE ROLE $NEW_USER;
							ALTER ROLE $NEW_USER login password '$NEW_PSW';
					    GRANT CONNECT ON DATABASE $DATABASE TO $NEW_USER;
							revoke CONNECT on DATABASE $DATABASE from PUBLIC;
							grant USAGE on SCHEMA $SCHEMA to $NEW_USER;
							revoke ALL on ALL tables in schema public from PUBLIC;
							revoke ALL on ALL tables in schema $SCHEMA from PUBLIC;
							revoke $PRIVILEGI on ALL tables in schema $SCHEMA from $NEW_USER;
							revoke ALL on ALL sequences in schema public from PUBLIC;
							revoke ALL on ALL sequences in schema $SCHEMA from PUBLIC;
							grant SELECT on ALL sequences in schema $SCHEMA to $NEW_USER;
							grant USAGE on ALL sequences in schema $SCHEMA to $NEW_USER;
							grant USAGE on schema public to $NEW_USER;
							grant SELECT on ALL tables in schema public to $NEW_USER;
		        	alter default privileges in schema $SCHEMA revoke $PRIVILEGI on tables from $NEW_USER;
							select pg_sleep(3);
							\! clear
							\echo
							\du;
							\echo
							SELECT grantee, table_schema, table_name, privilege_type
							FROM information_schema.role_table_grants
							WHERE table_schema = '$SCHEMA' AND grantee = '$NEW_USER';
EOF
					echo ""
		    	echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					;;
		esac
		;;

 4)		clear
			echo ""
			echo -e "${txtsfoblu}Assegna a gruppo"
			echo -e "${normale}Questo tool permette associare ad un gruppo dei permessi o privilegi di "
			echo -e "SELECT,INSERT,UPDATE,DELETE"
			echo ""
				HOST,PORT,USER,PASSWORD
			clear
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -e "Inserisci il nome del database:"
			read DATABASE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\dn"
			echo -e "Inserisci il nome dello schema:"
			read SCHEMA
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo -e "Inserisci il nome del nuovo gruppo:"
			read NEW_GRP
			clear
			echo ""
			echo -e "Scegli i permessi (SELECT,INSERT,UPDATE,DELETE):"
			read PRIVILEGI
			clear
			echo ""
			echo -e "Vuoi (c)oncedere o (r)evocare i permessi?"
			read choice

		case $choice in

			c)	clear
					echo ""
					echo -e "Riassunto delle operazioni:"
					echo ""
					echo -e " - ${txtgiallo}Crea ${normale}un nuovo gruppo ${txtverde}$NEW_GRP ${normale}con permessi di ${txtverde}$PRIVILEGI"
					echo -e " - ${txtverde}Concedi ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}${txtverde}$PRIVILEGI ${normale}su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le sequenze sullo schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo sullo schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtciano}Modifica ${normale}i privilegi predefiniti nello schema ${txtverde}$SCHEMA ${normale}concedendo ${txtverde}$PRIVILEGI ${normale}sulle tabelle a ${txtverde}$NEW_GRP"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Premi un tasto per procedere..."
					read
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
							CREATE ROLE $NEW_GRP;
							GRANT CONNECT ON DATABASE $DATABASE TO $NEW_GRP;
							revoke CONNECT on DATABASE $DATABASE from PUBLIC;
							grant USAGE on SCHEMA $SCHEMA to $NEW_GRP;
							revoke ALL on ALL tables in schema public from PUBLIC;
							revoke ALL on ALL tables in schema $SCHEMA from PUBLIC;
							grant $PRIVILEGI on ALL tables in schema $SCHEMA to $NEW_GRP;
							revoke ALL on ALL sequences in schema public from PUBLIC;
							revoke ALL on ALL sequences in schema $SCHEMA from PUBLIC;
							grant SELECT on ALL sequences in schema $SCHEMA to $NEW_GRP;
							grant USAGE on ALL sequences in schema $SCHEMA to $NEW_GRP;
							grant USAGE on schema public to $NEW_GRP;
							grant SELECT on ALL tables in schema public to $NEW_GRP;
							alter default privileges in schema $SCHEMA grant $PRIVILEGI on tables to $NEW_GRP;
							select pg_sleep(3);
							\! clear
							\echo
							\du;
							\echo
							SELECT grantee, table_schema, table_name, privilege_type
							FROM information_schema.role_table_grants
							WHERE table_schema = '$SCHEMA' AND grantee = '$NEW_GRP';
EOF
					echo ""
	    		echo -n "Premi un tasto per tornare al menù principale... "
	    		echo ""
	    		read
	    			gpsql.sh
					;;

			r)	clear
					echo ""
					echo -e "Riassunto delle operazioni:"
					echo ""
					echo -e " - ${txtgiallo}Crea ${normale}un nuovo gruppo ${txtverde}$NEW_GRP ${normale}con permessi di ${txtverde}$PRIVILEGI"
					echo -e " - ${txtverde}Concedi ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}la connessione sul database ${txtverde}$DATABASE ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}${txtverde}$PRIVILEGI ${normale}su tutte le tabelle nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}$NEW_GRP"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}PUBLIC ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtrosso}Revoca ${normale}tutto su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}da ${txtverde}PUBLIC"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le sequenze sullo schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo su tutte le sequenze nello schema ${txtverde}$SCHEMA ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}utilizzo sullo schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtverde}Concedi ${normale}la selezione su tutte le tabelle nello schema ${txtverde}PUBLIC ${normale}a ${txtverde}$NEW_GRP"
					echo -e " - ${txtciano}Modifica ${normale}i privilegi predefiniti nello schema ${txtverde}$SCHEMA ${normale}revocando ${txtverde}$PRIVILEGI ${normale}sulle tabelle da ${txtverde}$NEW_GRP"
					echo ""
					echo -e "${grassetto}${txtverde}-->${normale} Premi un tasto per procedere..."
					read
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
							CREATE ROLE $NEW_GRP;
	    				GRANT CONNECT ON DATABASE $DATABASE TO $NEW_GRP;
							revoke CONNECT on DATABASE $DATABASE from PUBLIC;
							grant USAGE on SCHEMA $SCHEMA to $NEW_GRP;
							revoke ALL on ALL tables in schema public from PUBLIC;
							revoke ALL on ALL tables in schema $SCHEMA from PUBLIC;
							revoke $PRIVILEGI on ALL tables in schema $SCHEMA from $NEW_GRP;
							revoke ALL on ALL sequences in schema public from PUBLIC;
							revoke ALL on ALL sequences in schema $SCHEMA from PUBLIC;
							grant SELECT on ALL sequences in schema $SCHEMA to $NEW_GRP;
							grant USAGE on ALL sequences in schema $SCHEMA to $NEW_GRP;
							grant USAGE on schema public to $NEW_GRP;
							grant SELECT on ALL tables in schema public to $NEW_GRP;
	    				alter default privileges in schema $SCHEMA revoke $PRIVILEGI on tables from $NEW_GRP;
							select pg_sleep(3);
							\! clear
							\echo
							\du;
							\echo
							SELECT grantee, table_schema, table_name, privilege_type
							FROM information_schema.role_table_grants
							WHERE table_schema = '$SCHEMA' AND grantee = '$NEW_GRP';
EOF
					echo ""
	      	echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					;;
		esac
		;;

  5)		gpsql.sh
			;;

esac
;;

 9)		clear
    	# echo ""
    	# echo "Ciao a presto...  "
    	# echo ""
    	#sleep 1
    	;;


esac
