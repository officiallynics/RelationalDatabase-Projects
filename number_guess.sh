#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

FIND_USERNAME=$($PSQL "SELECT username FROM players WHERE username='$USERNAME'")
NUMBER_OF_GUESSES=0

if [[ -z $FIND_USERNAME ]]
then
  # Welcome, <username>! It looks like this is your first time here.
  echo Welcome, $USERNAME! It looks like this is your first time here.
  SECRET_NUMBER=$(( RANDOM % 1001 ))
  echo -e "\nGuess the secret number between 1 and 1000:"
    while [[ $GUESS -ne $SECRET_NUMBER ]]
    do
      ((NUMBER_OF_GUESSES++))
      read GUESS
      if [[ $GUESS =~ "^[+-]?[0-9]+$" ]]
      then
        echo That is not an integer, guess again:
        
      else
        if [[ $GUESS -gt $SECRET_NUMBER ]]
        then
          echo "It's lower than that, guess again:" 
        else 
          echo "It's higher than that, guess again:"
        fi 
      fi
      done
    # You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
    INSERT_TO_PLAYERS=$($PSQL "INSERT INTO players(username, games_played) VALUES('$USERNAME', 1)")
    PLAYER_ID=$($PSQL "SELECT id FROM players WHERE username='$USERNAME'")
    INSERT_TO_GAMES=$($PSQL "INSERT INTO games(user_id, no_of_guesses) VALUES($PLAYER_ID, $NUMBER_OF_GUESSES)")
    #You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
  
else 
  USER_ID=$($PSQL "SELECT id FROM players WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT no_of_guesses FROM games WHERE user_id=$USER_ID ORDER BY no_of_guesses LIMIT 1")
  
  #Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  SECRET_NUMBER=$(( RANDOM % 1001 ))
  echo -e "\nGuess the secret number between 1 and 1000:"
    while [[ $GUESS -ne $SECRET_NUMBER ]]
    do
      ((NUMBER_OF_GUESSES++))
      
      if [[ $GUESS =~ "^[+-]?[0-9]+$" ]]
      then
        echo That is not an integer, guess again:
        
      else
        if [[ $GUESS -gt $SECRET_NUMBER ]]
        then
          echo "It's lower than that, guess again:" 
        else 
          echo "It's higher than that, guess again:"
        fi 
      fi
      read GUESS
    done
      #INSERT_TO_GAMES=$($PSQL "INSERT INTO games(user_id, no_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
      #UPDATE_GAMES=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED+1 WHERE username='$USERNAME'")
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!
fi 

