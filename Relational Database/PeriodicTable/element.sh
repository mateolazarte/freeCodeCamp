#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


DATA=$1

if [[ -z $DATA ]]
then 
  echo Please provide an element as an argument.
else

  if [[ ! $DATA =~ ^[0-9]+$ ]]
  then
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$DATA' OR name='$DATA'")
  else
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$DATA")
  fi

  if [[ -z $NUMBER ]]
  then
    echo I could not find that element in the database.
  else

    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$NUMBER")

    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$NUMBER")

    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$NUMBER")

    TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")

    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$NUMBER")

    MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$NUMBER")

    BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$NUMBER")

    echo -e "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  
  fi
fi