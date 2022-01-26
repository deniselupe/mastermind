# frozen_string_literal: true

# This modules provides an introduction to the game as well as collect session details
module Instructions
  def introductions
    puts <<~INSTRUCTIONS_ONE
      Welcome to Mastermind!

      Mastermind is a code-breaking game between two players:
      1. Code Maker
      2. Code Breaker

      The Code Maker makes a master code by choosing a pattern of four
      colored pegs, stored in a row on the game board that is not
      visible to the Code Breaker.

      There are six color pegs that the code maker can choose from
      to create their master code:
      - #{'Yellow'.yellow}, #{'Blue'.blue}, #{'Purple'.purple}, #{'Green'.green}, #{'Cyan'.cyan}, #{'Red'.red}
    INSTRUCTIONS_ONE

    next_page

    puts <<~INSTRUCTIONS_TWO
      The Code Breaker will have between 8 and 12 turns to guess
      the master code, in both color and order. The Code Breaker
      will place a row of 4 color pegs on the game board for each guess
      they make.

      After each guess, the Code Maker will provide feedback by placing
      either black or white key pegs in the small holes located beside
      the guess' row.

      The Code Maker places a black key peg for each color peg within the guess
      that matches the master code's color and position. A white key peg indicates
      the existence of a correct color peg placed in the wrong position.
    INSTRUCTIONS_TWO

    next_page
  end

  def next_page
    print "\nPress 'ENTER' to continue ".cyan
    key = $stdin.noecho(&:gets)

    until key == "\n"
      key = gets
    end

    clear_screen
  end

  def clear_screen
    print "\e[2J\e[H"
  end

  def role_selector
    clear_screen
    puts "\nThis game has two different player roles:"
    puts "\t1. Play as the Code Breaker to try and guess the randomly generated code"
    puts "\t2. Create the code as the Code Maker and try to outsmart the NPC"
    print "\nSelect your role (1 or 2): "
    role = gets.chomp.to_i
  end

  def number_of_rounds
    clear_screen
    print "\nHow many rounds would you like to play? (NOTE: Only EVEN values): "
    rounds = gets.chomp.to_i

    until rounds.even?
      print "\nThis is not an even amount of rounds, please enter an even amount of rounds to play: "
      rounds = gets.chomp.to_i
    end
  end

  def number_of_guesses
    clear_screen
    print "\nHow many guesses would you like the Code Breaker to make (NOTE: Between 8 to 12 guesses): "
    guesses = gets.chomp.to_i

    until guesses.between?(8, 12)
      print "\nSorry, not possible. Please enter a number of guesses that is between 8 and 12: "
      guesses = gets.chomp.to_i
    end
  end
end
