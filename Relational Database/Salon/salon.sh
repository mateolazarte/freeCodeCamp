#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  SERVICES=$($PSQL "SELECT * FROM services;")
  
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo $SERVICE_ID")" $NAME
  done

  read SERVICE_ID_SELECTED

  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_ID ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
}

MAIN_MENU

echo "What's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_ID ]]
then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  echo $($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
fi

SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

echo $($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.



