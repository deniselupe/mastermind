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

    until @current_guess_num.negative? || @winner == true
      @board.print_board
      puts "\nMASTER CODE: #{@master_code.join('')}\nComputer is thinking of a guess...".cyan
      sleep 4
      @guess = computer_guess
      compare_guess
      @board.print_board
      puts "\nMASTER CODE: #{@master_code.join('')}\nCOMPUTER GUESSED: #{@guess.join}".cyan
      @current_guess_num -= 1
      sleep 3
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
    if @current_guess_num == @num_of_guesses
      %w[1 1 2 2]
    else
      %w[1 2 3 4]
    end
  end

  # After receiving key peg feedback after a computer guess, eliminate possibilities
  # from @possible_outcomes that do not return the same exact key peg feedback
  # should the guess itself be the master code
  def possibility_eliminator
    remaining_possibilities = []

    @possible_outcomes.each do |possibility|
      temp_guess = @guess.map { |val| val }
      possibility_result = []

      exact_match(temp_guess, @guess, possibility, possibility_result)
      partial_match(temp_guess, @guess, possibility, possibility_result)
      remaining_possibilities.push(possibility) if possibility_result == @key_pegs
    end

    @possible_outcomes = remaining_possibilities
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
