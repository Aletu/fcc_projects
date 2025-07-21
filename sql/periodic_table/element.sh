#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# If argument is empty
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # If the argument is a number, search by atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    search_element_result=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$1;")
  else
    search_element_result=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$1' OR name='$1';")
  fi

  # If the searched element exists
  if [[ -n $search_element_result ]]
  then
    IFS='|' read atomic_number element_name element_symbol element_type atomic_mass melting_point_celsius boiling_point_celsius <<< "$search_element_result"
    echo "The element with atomic number $atomic_number is $element_name ($element_symbol). It's a $element_type, with a mass of $atomic_mass amu. $element_name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
  else
    echo "I could not find that element in the database."
  fi
fi

