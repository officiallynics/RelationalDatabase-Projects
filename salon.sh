#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ MY SALON ~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi

  echo -e "\nWelcome! What do you need?"
  echo -e "\n1) Hair Care\n2) Nail Care\n3) Skin Care"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
  1) APP_MENU ;;
  2) APP_MENU ;;
  3) APP_MENU ;;
  *) MAIN_MENU "Please choose a number available in the list." ;;
  esac
}

APP_MENU() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $NAME ]]
  then 
    echo -e "\nYou might be new here, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    echo Hi $CUSTOMER_NAME! What time would you like?
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
    APPOINT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME." 
  fi
}

MAIN_MENU
