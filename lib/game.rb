# frozen_string_literal: true

require_relative 'prompts'
require_relative 'stylable'
require_relative 'human-breaker'
require 'io/console'

# Activating Monkey Patch so that CLI can have colored text
String.include Stylable::String

# This is the class that controls the flow of the game
class Game
  attr_reader :rounds, :guess_num, :player_role

  include Prompts

  def play
    introductions
    @player_role = role_selector
    @rounds = number_of_rounds
    @guess_num = number_of_guesses
    HumanBreaker.new(@rounds, @guess_num).play
  end
end
