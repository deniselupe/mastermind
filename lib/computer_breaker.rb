# frozen_string_literal: true

require_relative 'code_breaker'

# This class defines the actions of the computer should the player choose to be Code Maker
class ComputerBreaker < CodeBreaker
  def initialize(guesses)
    super(guesses)
    @possible_outcomes = %w[1 2 3 4 5 6].repeated_permutation(4).to_a
  end

  def play
    maker_instructions
    @master_code = input_code
    @board.print_board

    until @guess_num.negative? || @winner == true
      @guess = computer_guess
      compare_guess
      @board.print_board
      puts "\nCOMPUTER GUESSED: #{@guess.join}"
      @guess_num -= 1
    end

    win_eval
  end

  private

  # Prompts the human for to enter a valid Master Code
  def input_code
    Stylable.line_separator
    print "\nInput your Master Code: "

    until (code = gets.chomp).match?(/^[1-6]{4}$/)
      print "\nInvalid input. Enter a 4 digit code, each digit being between 1 and 6: "
    end

    code.split('')
  end

  # The logic for the computer to enter their next guess
  def computer_guess
    ['1', '2', '3', '4']
  end

  # This method verifies if the Code Breaker won, then prints the respective announcement
  def win_eval
    @board.print_board
    puts "\nMASTER CODE: #{@master_code.join('')}".cyan

    if @winner == true
      puts "\nYOU LOSE! THE COMPUTER HAS CRACKED THE MASTER CODE.".red
    else
      puts "\nYOU WIN! YOU HAVE OUTSMARTED THE COMPUTER!".green
    end
  end
end
