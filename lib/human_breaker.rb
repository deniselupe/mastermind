# frozen_string_literal: true

require_relative 'code_breaker'

# This class defines methods that only get called when the human selects the Code Breaker role
class HumanBreaker < CodeBreaker
  def play
    @master_code = code_generator
    breaker_instructions
    @board.print_board

    until @guess_num.negative? || @winner == true
      @guess = input_guess
      compare_guess
      @board.print_board
      puts "\nYOU GUESSED: #{@guess.join}"
      @guess_num -= 1
    end

    win_eval
  end

  private

  # Creates a randomly generated master code when the Computer is Code Maker
  def code_generator
    master_code = []
    4.times { master_code.push(%w[1 2 3 4 5 6].sample) }
    master_code
  end

  # Prompts the human Code Breaker for their guess
  def input_guess
    Stylable.line_separator
    print "\nInput your guess: "

    until (guess = gets.chomp).match?(/^[1-6]{4}$/)
      print "\nInvalid guess. Enter a guess that's a 4 digit code, each digit being between 1 and 6: "
    end

    guess.split('')
  end
end
