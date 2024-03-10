#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( $RANDOM % 1000 + 1 ))

echo Enter your username:

read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

if [[ -z $USER_ID ]]
then 
  echo Welcome, $USERNAME! It looks like this is your first time here.
  $($PSQL "INSERT INTO users(username, games_played) VALUES ('$USERNAME', 0);")
  GAMES=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
  BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
else
  GAMES=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
  BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
  echo Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses.
fi

echo Guess the secret number between 1 and 1000:

read GUESS

TRIES=1

while (( GUESS != NUMBER ))
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    read GUESS
  else
    if (( GUESS > NUMBER ))
    then 
      (( TRIES++ ))
      echo "It's lower than that, guess again:"
      read GUESS
    else
      (( TRIES++ ))
      echo "It's higher than that, guess again:"
      read GUESS
    fi
  fi  
done

(( GAMES++ ))

if [[ -z $BEST ]]
then 
  $($PSQL "UPDATE users SET games_played=$GAMES, best_game=$TRIES WHERE username='$USERNAME';")
else
  if (( TRIES < BEST ))
  then
    $($PSQL "UPDATE users SET games_played=$GAMES, best_game=$TRIES WHERE username='$USERNAME';")
  else
    $($PSQL "UPDATE users SET games_played=$GAMES WHERE username='$USERNAME';")
  fi
fi  

echo You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!