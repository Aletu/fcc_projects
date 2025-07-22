#!/bin/bash

# Variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate secret number (random between 1 and 1000)
secret_number=$(( 1 + RANDOM % 1000 ))

# Ask user for their username
echo -n "Enter your username: "
read username

# Query database for user_id, games_played, and best_game
user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username';")
games_played=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING (user_id) WHERE user_id=$user_id;")
best_game=$($PSQL "SELECT min(total_guesses) FROM users INNER JOIN games USING (user_id) WHERE user_id=$user_id;")


# If user_id exists in database, greet user and give stats
if [[ -n $user_id ]]
then
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
# Else welcome user and add to database
else
  insert_user_result=$($PSQL "INSERT INTO users(username) VALUES('$username');")
  echo "Welcome, $username! It looks like this is your first time here."
  user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username';")
fi

echo -n "Guess the secret number between 1 and 1000: "

# While the guess is wrong or isn't an integer:
user_guess_count=0
while true
do
  read user_guess
  (( user_guess_count++ ))
  # If the number isn't an integer
  if [[ ! $user_guess =~ ^[+-]?[0-9]+$ ]]
  then
    echo -n "That is not an integer, guess again: "
    continue
  elif (( $user_guess > $secret_number ))
  then
    echo -n "It's lower than that, guess again: "
    continue

  elif (( $user_guess < $secret_number ))
  then
    echo -n "It's higher than that, guess again: "
    continue

  else
    echo "You guessed it in $user_guess_count tries. The secret number was $secret_number. Nice job!"
    insert_game_result=$($PSQL "INSERT INTO games(total_guesses, user_id) VALUES($user_guess_count, $user_id);")
    break
  fi
done