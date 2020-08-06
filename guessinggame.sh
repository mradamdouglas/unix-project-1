#!/usr/bin/env bash
# File: guessinggame.sh
# Guess the number of files in the directory

function evaluateGuess {
    if [[ $guess -lt totFiles ]]
    then
        echo "Your guess was too low"
    elif [[ $guess -gt totFiles ]]
    then
        echo "Your guess was too high"
    fi
}

max=100
totFiles=$(ls -l *.* | wc -l)
totGuesses=0
patt="^[0-9]*$"

echo "Guess the number of files in the $PWD directory. Enter an integer between 0 and $max"

while [[ $guess -ne $totFiles ]]
do 
    read guess
    if ([[ $guess =~ $patt ]] && [[ $guess -le 100 ]] && [[ $guess -gt 0 ]])
    then
        let totGuesses=$totGuesses+1
        evaluateGuess
    else 
        echo "Your guess was invalid. Please try again"
    fi
done

if [[ totGuesses -eq 1 ]] 
then
    echo -e "\nINCREDIBLE!!! You guessed correctly on your very first try!!\n"
else   
    echo -e "\nCongratulations! You guessed correctly with $totGuesses tries!!!\n"
fi
