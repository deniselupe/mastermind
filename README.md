# Mastermind
I created this game for The Odin Project's [Mastermind](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind) assignment located in their [Ruby Programming](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming) learning path.

You can play the game [here](https://replit.com/@deniselupe/mastermind?v=1).

## Technologies Used
* Ruby
* Git
* Github
* GoormIDE (Cloud IDE)
* Linux Command Line

## Game's House Rules
The rules for my Mastermind game are different from the traditional rules documented on [Wikipedia](https://en.wikipedia.org/wiki/Mastermind_(board_game)).

Mastermind is a code-breaking game that consists of:
* A Code Maker
* A Code Breaker
* 6 Colored Pegs
* 2 Key Pegs
* 1 Master Code
* 8 to 12 guesses to crack the code

The Code Maker creates a master code that consists of 4 colored pegs. A master code might have duplicated colors present, resulting in 1,296 possible outcomes of what the master code could be. 

The Code Breaker has between 8 and 12 opportunities to guess the master code. After entering a guess, the Code Maker will use red and white key pegs to provide feedback on how close the Code Breaker is to crack the code.

A red key peg indicates that a colored peg within the Code Breaker's guess is correct in both color and position, while a white key peg informs that a colored peg within the guess has a matching color but is in the wrong order. The Code Breaker won't know which colored peg within their guess a key peg refers to, and a key peg doesn't make it obvious if there are any duplicated colors present in the master code.

In this version of Mastermind, the Code Breaker wins by cracking the master code within the number of guesses available. Otherwise, the Code Maker wins.

## Features Included
* Allow the player to select whether they want to play as Code Maker or Code Breaker
* Allow the player to choose how many guesses (between 8 and 12) the Code Breaker can have during a game session
* Displays a game board on the terminal that tracks results of the game
* When playing as the Code Maker, play against an AI that will crack the master code in 5 guesses or less
* Replay game option
