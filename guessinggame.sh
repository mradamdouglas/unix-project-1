#!/usr/bin/env bash
# File: guessinggame.sh  Author: Adam Douglas
# Guess the number of files in the directory

function evaluateGuess {
    if [[ $guess -lt totFiles ]]
 	then
		echo -e "Your guess of $guess is too low\n"
		let guessNbr=$guessNbr+1
	elif [[ $guess -gt totFiles ]]
	then
		echo -e "Your guess of $guess is too high\n"
		let guessNbr=$guessNbr+1
	fi
}

totFiles=$(ls | wc -l)
guessNbr=1
patt="^[0-9]*$"
max=100  #default value if input parameter is invalid

if [[ $1 =~ $patt ]] && [[ $1 -gt totFiles ]]
then
	max=$1
fi

echo "Guess the number of files in the $PWD directory. Enter an integer between 0 and $max"

while [[ $guess -ne $totFiles ]]
do 
	printf "Enter guess #$guessNbr: "
    read -r guess
    if ([[ $guess =~ $patt ]] && [[ $guess -le $max ]] && [[ $guess -gt 0 ]])
    then
        evaluateGuess
    else 
        echo "$guess is an invalid value.  Please enter an integer between 0 and $max"
    fi
done

if [[ guessNbr -eq 1 ]] 
then
    echo -e "\nINCREDIBLE!!! You guessed correctly on your very first try!!\n"
else   
    echo -e "\nCongratulations! You guessed correctly with $guessNbr tries!!!\n"
fi
