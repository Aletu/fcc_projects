#!/bin/bash

# Colors for some echo commands
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
# PSQL command for interacting with the database
PSQL="psql -t --username=freecodecamp --dbname=salon -c"

echo -e "\n~~~~~ Aletu's Salon ~~~~~\n"

MAIN_MENU() {
  if [[ ! -z $1 ]]
  then
    echo -e "$1"
  fi

  echo -e "Welcome to Aletu's Salon, which service are you interested in?\n"

  ALL_SERVICES_RESULT=$($PSQL "SELECT * FROM services")
  echo "$ALL_SERVICES_RESULT" | while read ID BAR SERVICE
  do
    echo "$ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED
  # Get service name (xargs removes leading and following whitespace)
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | xargs)
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "${YELLOW}Please choose a valid service.${NC}"
  else
    case $SERVICE_ID_SELECTED in
      1) echo -e "${GREEN}Cut service selected${NC}" ;;
      2) echo -e "${GREEN}Trim service selected${NC}" ;;
      3) echo -e "${GREEN}Color service selected${NC}" ;;
    esac

    # Get customer's phone
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE
    PHONE_LOOKUP_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # If customer's phone doesn't exist in the database
    if [[ -z $PHONE_LOOKUP_RESULT ]]
    then
      # Get customer's name
      echo -e "\nWe don't have a record for that phone number, what is your name?"
      read CUSTOMER_NAME
      # Insert phone and name into customers table
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # Look up customer name on database using their phone number
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)
    
    # Get service time
    echo -e "\nAt what time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Get customer ID
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # Enter data into appointments
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

MAIN_MENU
