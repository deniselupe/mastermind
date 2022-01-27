# frozen_string_literal: true

require_relative 'instructions'
require 'io/console'

# This is the class that controls the flow of the game
class Game
  attr_reader :player_role, :rounds, :guesses, :board

  include Instructions

  def initialize
    @colors = [1, 2, 3, 4, 5, 6]
    @possible_outcomes = @colors.repeated_permutation(4).to_a
  end

  def play
    introductions
    @player_role = role_selector
    @rounds = number_of_rounds
    @guesses = number_of_guesses
    @board = Board.new(guesses)
  end
end
