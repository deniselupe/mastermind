# frozen_string_literal: true

# This module provides an introduction to the game as well as collect session details
module Prompts
  def introductions
    puts <<~INSTRUCTIONS_ONE
      Welcome to Mastermind!

      Mastermind is a code-breaking game between two players:
      1. Code Maker
      2. Code Breaker

      The #{'CODE MAKER'.green} makes a master code by choosing a pattern of four
      colored pegs, stored in a row on the game board that is not
      visible to the #{'CODE BREAKER'.purple}.

      There are six color pegs that the code maker can choose from
      to create their master code:
      - #{'Yellow'.yellow}, #{'Blue'.blue}, #{'Purple'.purple}, #{'Green'.green}, #{'Cyan'.cyan}, #{'Red'.red}
    INSTRUCTIONS_ONE

    Stylable.next_page

    puts <<~INSTRUCTIONS_TWO
      The #{'CODE BREAKER'.green} will have between 8 and 12 turns to guess
      the master code, in both color and order. The #{'CODE BREAKER'.green}
      will place a row of 4 color pegs on the game board for each guess
      they make.

      After each guess, the #{'CODE MAKER'.purple} will provide feedback by placing
      either black or white key pegs in the small holes located beside
      the guess' row.

      The #{'CODE MAKER'.purple} places a black key peg for each color peg within the guess
      that matches the master code's color and position. A white key peg indicates
      the existence of a correct color peg placed in the wrong position.
    INSTRUCTIONS_TWO

    Stylable.next_page
  end

  def role_selector
    Stylable.clear_screen
    puts 'This game has two different player roles:'
    puts "\t1. Play as the #{'CODE BREAKER'.green} to try and guess the randomly generated code"
    puts "\t2. Create the code as the #{'CODE MAKER'.purple} and try to outsmart the NPC"
    print "\nSelect your role (1 or 2): "

    until (role = gets.chomp).match?(/^[1-2]$/)
      Stylable.clear_screen
      puts 'This game has two different player roles:'
      puts "\t1. Play as the #{'CODE BREAKER'.green} to try and guess the randomly generated code"
      puts "\t2. Create the code as the #{'CODE MAKER'.purple} and try to outsmart the NPC"
      print "\nInvalid option, please select your role (1: #{'Code Breaker'.green}, 2: #{'Code Maker'.purple}): "
    end

    role
  end

  def number_of_rounds
    Stylable.line_separator
    print "\nHow many rounds would you like to play? (NOTE: Only EVEN values): "

    until (rounds = gets.chomp.to_i).even? && !rounds.zero?
      print "\nThis is not an even amount of rounds, please enter an even amount of rounds to play: "
    end

    rounds
  end

  def number_of_guesses
    Stylable.line_separator
    print "\nHow many guesses would you like the Code Breaker to make (NOTE: Between 8 to 12 guesses): "

    until (guesses = gets.chomp.to_i).between?(8, 12)
      print "\nSorry, not possible. Please enter a number of guesses that is between 8 and 12: "
    end

    guesses
  end

  def input_guess
    Stylable.line_separator
    print "\nInput your guess: "

    until (guess = gets.chomp).match?(/^[1-6]{4}$/)
      print "\nThis is not a valid guess, enter a guess that is 4 characters long and is between 1 and 6: "
    end

    guess.split('')
  end
end
