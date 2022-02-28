# frozen_string_literal: true

# This module provides instructions to the game as well as the different player roles
module Instructions
  def introductions
    Stylable.clear_screen
    puts <<~INSTRUCTIONS_ONE
      #{'WELCOME TO MASTERMIND!'.bold.underline}

      Mastermind is a code-breaking game between two players:
      1. Code Maker
      2. Code Breaker
    INSTRUCTIONS_ONE

    Stylable.next_page

    puts <<~INSTRUCTIONS_TWO
      #{'CODE MAKER:'.purple}

      The #{'CODE MAKER'.purple} makes a master code by choosing a pattern of four
      colored pegs, stored in a row on the game board that is not
      visible to the #{'CODE BREAKER'.green}.

      - The Master Code is a pattern of 4 Color Pegs
      - Duplicate Color Pegs can exist within the Master Code

      There are six color pegs that the code maker can choose from
      to create their master code:
      - #{'Yellow'.yellow}, #{'Blue'.blue}, #{'Purple'.purple}, #{'Green'.green}, #{'Cyan'.cyan}, #{'Red'.red}
    INSTRUCTIONS_TWO

    Stylable.next_page

    puts <<~INSTRUCTIONS_THREE
      #{'CODE BREAKER:'.green}

      The #{'CODE BREAKER'.green} has between 8 and 12 guesses to crack
      the master code, in both color and order. The #{'CODE BREAKER'.green}
      will enter their guess as a 4 digit code, each digit being between 1 and 6.

      Each number corresponds to the following color:
        1. #{Stylable::Board::COLOR_PEG.yellow}
        2. #{Stylable::Board::COLOR_PEG.blue}
        3. #{Stylable::Board::COLOR_PEG.purple}
        4. #{Stylable::Board::COLOR_PEG.green}
        5. #{Stylable::Board::COLOR_PEG.cyan}
        6. #{Stylable::Board::COLOR_PEG.red}
    INSTRUCTIONS_THREE

    Stylable.next_page

    puts <<~INSTRUCTIONS_FOUR
      HOW TO WIN:

      After each guess, the #{'CODE MAKER'.purple} will provide feedback by placing
      either red or white key pegs in the small holes located beside
      the guess' row. The #{'CODE BREAKER'.green} will use this feedback to determine
      the next best guess.

      - A red key peg is placed for each color peg within the guess that matches the
        master code's color and position.
      - A white key peg is placed for each color peg that is correct in color but in the
        wrong position.
    INSTRUCTIONS_FOUR

    Stylable.next_page
  end

  def breaker_instructions
    Stylable.clear_screen
    puts <<~HUMAN_BREAKER_INSTRUCTIONS
      #{'THE COMPUTER HAS CREATED THE MASTER CODE'.bold.underline.red}

      Remember:
        - The Master Code is a pattern of 4 Color Pegs
        - Duplicate Color Pegs can exist within the Master Code
        - You will enter your guess as a 4 digit code, each digit being between 1 and 6.

      Each number corresponds to the following color:
        1. #{Stylable::Board::COLOR_PEG.yellow}
        2. #{Stylable::Board::COLOR_PEG.blue}
        3. #{Stylable::Board::COLOR_PEG.purple}
        4. #{Stylable::Board::COLOR_PEG.green}
        5. #{Stylable::Board::COLOR_PEG.cyan}
        6. #{Stylable::Board::COLOR_PEG.red}
    HUMAN_BREAKER_INSTRUCTIONS

    Stylable.next_page
  end
end
