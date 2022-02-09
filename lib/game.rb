# frozen_string_literal: true

require_relative 'instructions'
require_relative 'stylable'
require_relative 'human_breaker'
require 'io/console'

# Activating Monkey Patch so that CLI can have colored text
String.include Stylable::String

# This is the class that controls the flow of the game
class Game
  attr_reader :guess_num, :player_role

  include Instructions

  def play
    introductions
    @player_role = role_selector
    @guess_num = number_of_guesses
    HumanBreaker.new(@guess_num).play
  end

  def role_selector
    Stylable.clear_screen
    puts 'This game has two different player roles:'
    puts "\t1. Play as the #{'CODE BREAKER'.green} to try and guess the randomly generated master code"
    puts "\t2. Create the master code as the #{'CODE MAKER'.purple} and try to outsmart the NPC"
    print "\nSelect your role (1 or 2): "

    until (role = gets.chomp).match?(/^[1-2]$/)
      Stylable.clear_screen
      puts 'This game has two different player roles:'
      puts "\t1. Play as the #{'CODE BREAKER'.green} to try and guess the randomly generated master code"
      puts "\t2. Create the master code as the #{'CODE MAKER'.purple} and try to outsmart the NPC"
      print "\nInvalid option, please select your role (1: #{'Code Breaker'.green}, 2: #{'Code Maker'.purple}): "
    end

    role
  end

  def number_of_guesses
    Stylable.line_separator
    print "\nHow many guesses would you like the Code Breaker to make (NOTE: Between 8 to 12 guesses): "

    until (guesses = gets.chomp.to_i).between?(8, 12)
      print "\nSorry, not possible. Please enter a number of guesses that is between 8 and 12: "
    end

    guesses
  end
end
