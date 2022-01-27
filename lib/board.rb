# frozen_string_literal: true

require_relative 'stylable'

# This class defines actions that the game board takes during a game session of Mastermind
class Board
  attr_reader :board

  include Stylable::Board

  def initialize(rows)
    @board = []
    board_creator(rows)
  end

  def board_creator(rows)
    rows.times { @board.push({guess: Array.new(4), keys: Array.new(4)}) }
  end
end
