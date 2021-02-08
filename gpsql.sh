#!/bin/bash
#
# versione 1.0 creata da MS in data 31/01/2021
#########################################################################################
# VARIABILI DI CONNESSIONE
#########################################################################################
BTITLE="GESTIONE PSQL 1.0 by MS"
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
function variabili_HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
		read -s
		if [[ $REPLY ]]; then
			PASSWORD=$REPLY
		fi
		echo ""

    read -p "Imposta EPSG di partenza (default $EPSG1): "
		if [[ $REPLY ]]; then
			EPSG1=$REPLY
		fi
		echo $EPSG1

    read -p "Imposta EPSG di destinazione (default $EPSG2): "
		if [[ $REPLY ]]; then
			EPSG2=$REPLY
		fi
		echo $EPSG2

    read -p "Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo $PATH_FILE

    read -p "Imposta il nome della tabella di destinazione (default $NEW_TABLE): "
		if [[ $REPLY ]]; then
			NEW_TABLE=$REPLY
		fi
		echo $NEW_TABLE

}

function variabili_HOST,PORT,USER,PASSWORD,DATABASE,SCHEMA,PATH_FILE {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

		read -p "Imposta DATABASE (default $DATABASE): "
		if [[ $REPLY ]]; then
			DATABASE=$REPLY
		fi
		echo $DATABASE

		read -p "Imposta SCHEMA (default $SCHEMA): "
		if [[ $REPLY ]]; then
			SCHEMA=$REPLY
		fi
		echo $SCHEMA

    read -p "Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo $PATH_FILE

}

function variabili_HOST,PORT,USER,PASSWORD,DATABASE,SCHEMA {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

		read -p "Imposta DATABASE (default $DATABASE): "
		if [[ $REPLY ]]; then
			DATABASE=$REPLY
		fi
		echo $DATABASE

		read -p "Imposta SCHEMA (default $SCHEMA): "
		if [[ $REPLY ]]; then
			SCHEMA=$REPLY
		fi
		echo $SCHEMA

}

function variabili_HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

		echo ""
		read -p "Imposta EPSG (default $EPSG): "
		if [[ $REPLY ]]; then
			EPSG=$REPLY
		fi
		echo $EPSG

    read -p "Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo $PATH_FILE
}

function variabili_HOST,PORT,USER,PASSWORD,PATH_DIR {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

		echo ""
    read -p "Imposta il path della directory: (default $PATH_DIR): "
		if [[ $REPLY ]]; then
			PATH_DIR=$REPLY
		fi
		echo $PATH_DIR

}

function variabili_HOST,PORT,USER,PASSWORD,PATH_FILE {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

    read -p "Imposta il path e nome del file (default $PATH_FILE): "
		if [[ $REPLY ]]; then
			PATH_FILE=$REPLY
		fi
		echo $PATH_FILE

}

function variabili_HOST,PORT,USER,PASSWORD,PATH_DUMP {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

		read -p "Imposta il path di destinazione (default $PATH_DUMP): "
		if [[ $REPLY ]]; then
			PATH_DUMP=$REPLY
		fi
		echo $PATH_DUMP

}

function variabili_HOST,PORT,USER,PASSWORD,PATH_RESTORE {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

		echo -E "Imposta PASSWORD : "
		read -s
		if [[ $REPLY ]]; then
			PASSWORD=$REPLY
		fi
		echo ""

		read -p "Imposta il path con il file di partenza (default $PATH_RESTORE): "
		if [[ $REPLY ]]; then
			PATH_RESTORE=$REPLY
		fi
		echo $PATH_RESTORE

}

function variabili_HOST,PORT,USER,PASSWORD {

		# echo `date`
		# echo ""
		read -p "Imposta HOST (default $HOST): "
		if [[ $REPLY ]]; then
			HOST=$REPLY
		fi
		echo $HOST

		read -p "Imposta PORT (default $PORT): "
		if [[ $REPLY ]]; then
			PORT=$REPLY
		fi
		echo $PORT

		read -p "Imposta USER (default $USER): "
		if [[ $REPLY ]]; then
			USER=$REPLY
		fi
		echo $USER

    echo -E "Imposta PASSWORD: "
    read -s
    if [[ $REPLY ]]; then
      PASSWORD=$REPLY
    fi
		echo ""

}

#########################################################################################
# FUNZIONI DI DIALOGO
#########################################################################################


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
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
      	gpsql.sh
			exit
			;;

	2)	clear
			echo ""
			echo -e "${txtsfoblu}Crea database"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
     		PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
      echo -n "Scrivi il nome del database da creare: "
      echo ""
      read VAR
			read -p "Vuoi creare anche l'estensione postgis? (s/n) (default $SI): "
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
      exit
      ;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella database"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
      clear
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
      echo ""
    	echo -n "Scrivi il nome del database da cancellare:  "
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
      exit
      ;;

  4)	clear
			echo ""
			echo -e "${txtsfoblu}Dump database"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD,PATH_DUMP
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scrivi il nome del database per il dump: "
			echo ""
			read VAR
				PGPASSWORD="$PASSWORD" pg_dump -U $USER -h $HOST -p $PORT $VAR > $PATH_DUMP/$VAR.sql
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
		  echo ""
			read
				gpsql.sh
			exit
			;;

  5)  clear
			echo ""
	 		echo -e "${txtsfoblu}Restore database"
	 		echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
	 		echo -e "database di uno specifico schema"
			echo ""
		 		variabili_HOST,PORT,USER,PASSWORD,PATH_RESTORE
		  clear
		 		PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
		 	echo ""
		 	echo -n "Scrivi il nome del database per il restore: "
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
			exit
			;;

  6)  clear
			echo ""
			echo -e "${txtsfoblu}Lista estensioni"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
			 	variabili_HOST,PORT,USER,PASSWORD
			clear
			  PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scrivi il nome del database per verificare le estensioni installate: "
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
			exit
			;;

	7)  	gpsql.sh
			exit
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
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
      echo -n "Inserisci il nome del database sul quale visionare gli schemi associati:  "
      echo ""
      read VAR
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR -h $HOST -p $PORT -c "\dn"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
			read
        gpsql.sh
			exit
      ;;

  2) 	clear
			echo ""
			echo -e "${txtsfoblu}Crea schema"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
  		echo ""
			echo -n "In quale database vuoi creare lo schema?  "
  		echo ""
      read VAR0
    	clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
  		echo ""
    	echo -n "Inserisci il nome dello schema da creare:  "
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
      exit
      ;;

	3)  clear
			echo ""
			echo -e "${txtsfoblu}Cancella schema"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "In quale database vuoi cancellare lo schema?  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Scrivi il nome dello schema da cancellare:  "
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
			exit
			;;

	4)   gpsql.sh
			exit
			;;
esac
;;

3)	clear

HEIGHT=16
WIDTH=38
CHOICE_HEIGHT=16
BACKTITLE="$BTITLE"
TITLE="Gestione tabelle"
MENU="Scegli un'opzione:"

OPTIONS=(

1 "Lista delle tabelle"
2 "Crea tabella"
3 "Crea tabella da *.sql"
4 "Crea tabella da *.csv"
5 "Cancella tabella"
6 "Dump tabella"
7 "Restore tabella"
8 "Menù principale"
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
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scegli il database:  "
			echo ""
			read VAR0
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			read -p "Vuoi vedere il contenuto della tabella? (s/n) (default $SI): "
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
			exit
			;;

	2)  clear
			echo ""
			echo -e "${txtsfoblu}Crea tabella"
			echo -e "${normale}Questo tool permette di generare una tabella veloce inserendo a mano i campi"
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "In quale database vuoi creare la tabella?  "
			echo ""
			read VAR1
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Inserisci il nome dello schema a cui associare la tabella da creare:  "
			echo ""
			read VAR2
		  clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dt $VAR2.*"
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "create schema $VAR2;"
			echo ""
   		echo -e "Scrivi il nome della ${txtsfoverde}tabella${normale} da creare con i relativi campi tra parentesi: \nes: ${txtsfoverde}test${normale}(id serial primary key,name text);"
			read VAR3
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "create table $VAR2.$VAR3"
			sleep 1
			clear
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Crea tabella da *.sql"
			echo -e "${normale}Questo tool permette di generare una tabella a partire da un file *.sql"
				variabili_HOST,PORT,USER,PASSWORD,DATABASE,SCHEMA,PATH_FILE
				PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $DATABASE << EOF
					alter role $USER in database $DATABASE set search_path to $SCHEMA,public;
					\q
EOF
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "show search_path"
			sleep 1
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -f $PATH_FILE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c \
				"SELECT grantee, table_schema, table_name FROM information_schema.role_table_grants WHERE table_schema = '$SCHEMA' AND grantee = '$USER' "
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
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
			echo -n "Scegli un'opzione (1 - 3): "
			echo ""
			read -p "" choice

			case $choice in

			1)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv con geometria (Lat,Lon,Hei)${normale}"
						variabili_HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
					clear
					PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
					./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table temp --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR1.temp ADD COLUMN id SERIAL PRIMARY KEY;
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
					exit
					;;

			2)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv con geometria ${normale}"
					echo ""
						variabili_HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
						./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table $VAR2 --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR1.$VAR2 ADD COLUMN id SERIAL PRIMARY KEY;
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
					exit
					;;

			3)	clear
					echo ""
					echo -e "${txtsfoblu}Crea tabella da *.csv senza geometria${normale}"
						variabili_HOST,PORT,USER,PASSWORD,PATH_FILE
					clear
					PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
					echo ""
					echo -n "A quale database vuoi associare la creazione della tabella?  "
					echo ""
					read VAR0
					clear
					PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
					echo ""
					echo -e "A quale schema vuoi associare la creazione della tabella?\n(NB: se non presente lo schema inserito verrà creato)"
					read VAR1
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "create schema $VAR1"
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -e "Inserisci il nome della tabella da creare per l'import del file *.csv: "
					read VAR2
					clear
					sleep 1
					clear
					./pgfutter --host $HOST --port $PORT --dbname $VAR0 --schema $VAR1 --table $VAR2 --user $USER --pw $PASSWORD csv $PATH_FILE
					sleep 1
						PGPASSWORD="$PASSWORD" psql -U $USER -h $HOST -p $PORT -d $VAR0 << EOF
							ALTER TABLE $VAR2.temp ADD COLUMN id SERIAL PRIMARY KEY;
EOF
					sleep 2
					clear
						PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
					echo ""
					echo -n "Premi un tasto per tornare al menù principale... "
					echo ""
					read
						gpsql.sh
					exit
					;;

     *)   	gpsql.sh
					exit
					;;
					esac
					;;


	5)  clear
			echo ""
			echo -e "${txtsfoblu}Cancella tabella"
			echo -e "${normale}Questo tool permette di cancellare una tabella presente in un"
			echo -e "database"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "In quale database vuoi cancellare la tabella?  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Inserisci il nome dello schema a cui cancellare la tabella associata:  "
			echo ""
			read VAR2
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "\dt $VAR2.*"
			echo ""
			echo -n "Scrivi il nome della tabella da cancellare:  "
			echo ""
			read VAR3
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR1 -h $HOST -p $PORT -c "drop table $VAR2.$VAR3 cascade"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
			;;


	6)  clear
			echo ""
			echo -e "${txtsfoblu}Dump tabella"
			echo -e "${normale}Questo tool permette di fare un backup di una tabella in formato *.sql presente in un"
			echo -e "database"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD,PATH_DUMP
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
  		echo ""
			echo -n "Scegli il database: "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Scegli lo schema: "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "Scegli lo tabella da dumpare: "
			echo ""
			read VAR2
			read -p "Vuoi dumpare solo i dati? (s/n) (default $SI): "
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
			exit
			;;

	7)	clear
			echo ""
			echo -e "${txtsfoblu}Restore tabella"
			echo -e "${normale}Questo tool permette di fare un ripristino da un file in formato *.sql di una"
			echo -e "tabella per la successiva importazione in un database"
				variabili_HOST,PORT,USER,PASSWORD,PATH_RESTORE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scegli il database: "
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
			exit
			;;

	8)		gpsql.sh
			exit
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
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
			;;

	2)	clear
			echo ""
			echo -e "${txtsfoblu}Crea utente"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Scrivi il nome dell'utente da creare:  "
			echo ""
			read VAR
			echo ""
			echo -n "Scrivi la password per il superutente da creare:  "
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
			exit
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Crea superutente"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Scrivi il nome del superutente da creare:  "
			echo ""
			read VAR
			echo ""
			echo -n "Scrivi la password per il superutente da creare:  "
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
			exit
			;;

	4)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella utente"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $DATABASE -h $HOST -p $PORT -c "\du"
			echo ""
			echo -n "Scrivi il nome dell'utente da cancellare:  "
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
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
			;;


	5)	clear
			echo ""
			echo -e "${txtsfoblu}Associa utente a gruppo"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
    		psql -U postgres -d postgres -c "\du;"
    	echo ""
    	echo -n "Scrivi il nome del gruppo: "
    	echo ""
    	read VAR0
			clear
				psql -U postgres -d postgres -c "\du;"
			echo ""
			echo -n "Scrivi il nome dell'utente: "
			echo ""
			read VAR1
				psql -U postgres -d postgres -c "grant $VAR0 to $VAR1;"
			sleep 1
			clear
				psql -U postgres -d postgres -c "\du;"
			echo ""
			echo -n "Premi un tasto per tornare al menù principale... "
			echo ""
			read
				gpsql.sh
			exit
			;;

	6)		gpsql.sh
      exit
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
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "Premi un tasto per tornare al menù principale... "
      echo ""
      read
        gpsql.sh
      exit
		  ;;

	2)  clear
			echo ""
			echo -e "${txtsfoblu}Crea gruppo"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "Scrivi il nome del gruppo da creare:  "
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
      exit
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Cancella gruppo"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
      	PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
      echo ""
      echo -n "Scrivi il nome del gruppo da cancellare:  "
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
			exit
			;;



 	4)  	gpsql.sh
      exit
      ;;
esac
;;






6)	clear
		echo ""
		echo -e "${txtsfoblu}Importa raster"
		echo -e "${normale}Questo tool permette di importare un file raster (*.tif) all'interno di in un"
		echo -e "database di uno specifico schema"
		echo ""
			variabili_HOST,PORT,USER,PASSWORD,EPSG,PATH_FILE
		clear
		echo ""
			PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
		echo ""
		echo -e "Scegli il database: "
		read VAR0
		clear
			PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
		echo ""
		echo -n "Scegli lo schema: "
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
		exit
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
				variabili_HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Inserisci il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Inserisci o crea lo schema:  "
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
			exit
			;;

  2)  clear
			echo ""
			echo -e "${txtsfoblu}Export shapefile"
			echo -e "${normale}Questo tool permette di esportare in formato *.shp una tabella presente "
			echo -e "in un database specificandone il nome in uscita"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD,PATH_DIR
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scegli il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "Scegli la tabella da esportare:  "
			echo ""
			read VAR2
			echo ""
			echo -n "Inserisci il nome del file *.shp in uscita:  "
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
			exit
			;;

  3)  	gpsql.sh
			exit
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
				variabili_HOST,PORT,USER,PASSWORD
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Scegli il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Scegli lo schema:  "
			echo ""
			read VAR1
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dt $VAR1.*"
			echo ""
			echo -n "Scegli la tabella:  "
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
			exit
			;;

 2)   clear
			echo ""
			echo -e "${txtsfoblu}Privilegi a vista"
			echo -e "${normale}Questo tool permette di creare una tabella per mezzo del comando shp2psql e di"
			echo -e "importarla in un database"
				variabili_HOST,PORT,USER,PASSWORD,EPSG1,EPSG2,PATH_FILE,NEW_TABLE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -n "Inserisci il database:  "
			echo ""
			read VAR0
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d $VAR0 -h $HOST -p $PORT -c "\dn"
			echo ""
			echo -n "Inserisci o crea lo schema:  "
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
			exit
			;;

	3)	clear
			echo ""
			echo -e "${txtsfoblu}Assegna ad utente"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
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
			echo -e "Inserisci il nome del nuovo utente:"
			read NEW_USER
			echo -e "Inserisci la password per il nuovo utente:"
			read NEW_PSW
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
					echo -e "${normale}Procedo?"
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
					exit
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
					echo -e "${normale}Procedo?"
					echo ""
					echo -e "Procedo?"
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
					exit
					;;
		esac
		;;

 4)		clear
			echo ""
			echo -e "${txtsfoblu}Assegna a gruppo"
			echo -e "${normale}Questo tool permette di visionare la lista di tutte le tabelle presenti in un"
			echo -e "database di uno specifico schema"
			echo ""
				variabili_HOST,PORT,USER,PASSWORD
			echo ""
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\l"
			echo ""
			echo -e "Inserisci il nome del database:"
			read DATABASE
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\dn"
			echo -e "Inserisci il nome dello schema:"
			read SCHEMA
			clear
				PGPASSWORD="$PASSWORD" psql -U $USER -d postgres -h $HOST -p $PORT -c "\du"
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
					echo -e "${normale}Procedo?"
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
					exit
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
					echo -e "Procedo?"
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
						exit
						;;
		esac
		;;

esac
;;

 9)		clear
    	# echo ""
    	# echo "Ciao a presto...  "
    	# echo ""
    	#sleep 1
    	exit
    	;;

esac
;;

esac
