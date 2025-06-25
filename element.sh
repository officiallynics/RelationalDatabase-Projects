#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then 
  echo Please provide an element as an argument.
else 
  if [[ $1 -gt 0 && $1 -le 10 ]]
  then 
    ELEMENT=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
    TYPEID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPEID")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")
    MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")
    BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")
    # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    echo "The element with atomic number $1 is $ELEMENT ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT has a melting point of $MELTING celsius and a boiling point of $BOILING celsius." | sed 's/   //g'
  else
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")
    if [[ $1 == $SYMBOL ]]
    then 
      NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
      ELEMENT=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
      TYPEID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$NUMBER")
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPEID")
      MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$NUMBER")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$NUMBER")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$NUMBER")
      # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
      echo "The element with atomic number $NUMBER is $ELEMENT ($1). It's a $TYPE, with a mass of $MASS amu. $ELEMENT has a melting point of $MELTING celsius and a boiling point of $BOILING celsius." | sed 's/   //g'
    else
      ELEMENT=$($PSQL "SELECT name FROM elements WHERE name='$1'")
      if [[ $1 == $ELEMENT ]]
      then
        NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$NUMBER")
        TYPEID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$NUMBER")
        TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPEID")
        MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$NUMBER")
        MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$NUMBER")
        BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$NUMBER")
        # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
        echo "The element with atomic number $NUMBER is $1 ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT has a melting point of $MELTING celsius and a boiling point of $BOILING celsius." | sed 's/   //g'
      else
        echo I could not find that element in the database.
      fi
    fi
  fi
fi


