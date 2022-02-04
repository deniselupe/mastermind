# frozen_string_literal: true

require_relative 'prompts'
require_relative 'board'

# This class defines the actions of the game should the player chose to be Code Breaker
class HumanBreaker
  include Prompts

  def initialize(rounds, guesses)
    @rounds = rounds
    @board = Board.new(guesses)
    @guess_num = 0
    @possible_outcomes = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
    @computer_code = [1, 2, 3, 4, 5, 6].shuffle[0..3]
  end

  def play
    guess = input_guess
    @board.update_guess_row(guess, @guess_num)
    @board.print_board
  end
end