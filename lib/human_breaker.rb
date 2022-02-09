# frozen_string_literal: true

require_relative 'instructions'
require_relative 'board'

# This class defines the actions of the game should the player choose to be Code Breaker
class HumanBreaker
  attr_reader :guess, :key_pegs

  include Instructions

  def initialize(guesses)
    @board = Board.new(guesses)
    @guess_num = guesses - 1
    @possible_outcomes = %w[1 2 3 4 5 6].repeated_permutation(4).to_a
    @computer_code = code_generator
    @winner = false
  end

  def play
    human_instructions
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

  def input_guess
    Stylable.line_separator
    print "\nInput your guess: "

    until (guess = gets.chomp).match?(/^[1-6]{4}$/)
      print "\nInvalid guess. Enter a guess that's a 4 digit code, each digit being between 1 and 6: "
    end

    guess.split('')
  end

  def compare_guess
    temp_master = @computer_code.map { |val| val }
    @key_pegs = []
    exact_match(temp_master)
    partial_match(temp_master)
    @board.update_guess_row(@guess, @guess_num)
    @board.update_key_row(@key_pegs, @guess_num)

    # Determine if the code breaker has cracked the master code
    @winner = true if @key_pegs.length == 4 && @key_pegs.all? { |key| key == Stylable::Board::KEY_PEG.red }
  end

  # This method locates any color pegs that are the same color and position as the master code
  def exact_match(temp_master)
    @guess.each_with_index do |num, index|
      if num == @computer_code[index]
        @key_pegs.push(Stylable::Board::KEY_PEG.red)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end

  # This method locates and color pegs that are the correct color, but in the wrong position
  def partial_match(temp_master)
    @guess.each_with_index do |num, index|
      if num != @computer_code[index] && temp_master.include?(num)
        @key_pegs.push(Stylable::Board::KEY_PEG)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end

  def win_eval
    @board.print_board
    puts "\nMASTER CODE: #{@computer_code.join('')}".cyan

    if @winner == true
      puts "\nCONGRATS! YOU CRACKED THE MASTER CODE!".green
    else
      puts "\nYOU ARE OUT OF GUESSES. BETTER LUCK NEXT TIME!".red
    end
  end
end
