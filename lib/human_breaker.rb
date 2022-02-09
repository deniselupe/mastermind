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
  end

  def play
    Stylable.clear_screen
    human_instructions
    puts "Computer master code is #{@computer_code}"
    @guess = input_guess
    eval_guess
    @board.update_guess_row(@guess, @guess_num)
    @board.update_key_row(@key_pegs, @guess_num)
    @board.print_board
  end

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

  def eval_guess
    temp_master = @computer_code.map { |val| val }
    @key_pegs = []
    exact_match(temp_master)
    partial_match(temp_master)
  end

  def exact_match(temp_master)
    @guess.each_with_index do |num, index|
      if num == @computer_code[index]
        @key_pegs.push(Stylable::Board::KEY_PEG.red)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end

  def partial_match(temp_master)
    @guess.each_with_index do |num, index|
      if num != @computer_code[index] && temp_master.include?(num)
        @key_pegs.push(Stylable::Board::KEY_PEG)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end
end
