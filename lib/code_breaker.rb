# frozen_string_literal: true

require_relative 'instructions'
require_relative 'board'

# This class holds methods that will be used by both Human and Computer subclasses
class CodeBreaker
  attr_reader :master_code, :guess, :key_pegs

  include Instructions

  def initialize(guesses)
    @board = Board.new(guesses)
    @num_of_guesses = guesses - 1
    @current_guess_num = guesses - 1
    @winner = false
  end

  private

  def compare_guess
    temp_master = @master_code.map { |val| val }
    @key_pegs = []
    exact_match(temp_master, @master_code, @guess, @key_pegs)
    partial_match(temp_master, @master_code, @guess, @key_pegs)
    @board.update_guess_row(@guess, @current_guess_num)
    @board.update_key_row(@key_pegs, @current_guess_num)

    # Determine if the code breaker has cracked the master code
    @winner = true if @key_pegs.length == 4 && @key_pegs.all? { |key| key == Stylable::Board::KEY_PEG.red }
  end

  # This method locates any color pegs that are the same color and position as the master code
  def exact_match(temp, primary_code, secondary_code, result_list)
    secondary_code.each_with_index do |num, index|
      if num == primary_code[index]
        result_list.push(Stylable::Board::KEY_PEG.red)
        temp.delete_at(temp.index(num))
      end
    end
  end

  # This method locates and color pegs that are the correct color, but in the wrong position
  def partial_match(temp, primary_code, secondary_code, result_list)
    secondary_code.each_with_index do |num, index|
      if num != primary_code[index] && temp.include?(num)
        result_list.push(Stylable::Board::KEY_PEG)
        temp.delete_at(temp.index(num))
      end
    end
  end
end
