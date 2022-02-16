# frozen_string_literal: true

require_relative 'board'

# This class holds methods that will be used by both Human and Computer subclasses
class CodeBreaker
  attr_reader :master_code, :guess, :key_pegs

  include Instructions

  def initialize(guesses)
    @board = Board.new(guesses)
    @guess_num = guesses - 1
    @winner = false
  end

  private

  def compare_guess
    temp_master = @master_code.map { |val| val }
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
      if num == @master_code[index]
        @key_pegs.push(Stylable::Board::KEY_PEG.red)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end

  # This method locates and color pegs that are the correct color, but in the wrong position
  def partial_match(temp_master)
    @guess.each_with_index do |num, index|
      if num != @master_code[index] && temp_master.include?(num)
        @key_pegs.push(Stylable::Board::KEY_PEG)
        temp_master.delete_at(temp_master.index(num))
      end
    end
  end

  # This method verifies if the Code Breaker won, then prints the respective announcement
  def win_eval
    @board.print_board
    puts "\nMASTER CODE: #{@master_code.join('')}".cyan

    if @winner == true
      puts "\nCONGRATS! YOU CRACKED THE MASTER CODE!".green
    else
      puts "\nYOU ARE OUT OF GUESSES. BETTER LUCK NEXT TIME!".red
    end
  end
end
