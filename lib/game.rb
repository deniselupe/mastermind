require_relative './instructions.rb'
require 'io/console'

class Game
  include Instructions

  def initialize
    @colors = [1, 2, 3, 4, 5, 6]
    @possible_outcomes = @colors.repeated_permutation(4).to_a
    @rounds = ''
    @guesses = ''
  end

  def play
    introductions
    role_selector
    @rounds = number_of_rounds
    @guesses = number_of_guesses
  end
end