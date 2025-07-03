#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
REFERESH=$($PSQL "TRUNCATE TABLE teams, games")

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do 
    WINNER_TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$winner'")
    if [[ -z $WINNER_TEAMS && $winner != 'winner' ]]
    then
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      echo "Inserted, $winner winner."
    fi
    
      OPPONENT_TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$opponent'")
      if [[ -z $OPPONENT_TEAMS && $opponent != 'opponent' ]]
      then 
        INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
        echo "Inserted, $opponent opponent."
      fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    echo $winner
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    
    if [[ $year != 'year' && $round != 'round' && $winner_goals != 'winner_goals' && $opponent_goals != 'opponent_goals' ]]
    then 
    INSERT_TO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)")
    echo $INSERT_TO_GAMES
    fi

done
