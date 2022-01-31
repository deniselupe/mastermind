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
    rows.times { @board.push({guess: Array.new(4, EMPTY_COLOR), keys: Array.new(4, EMPTY_KEY)}) }
  end

  def print_board
    board_row = []

    @board.each do |row|
      board_row.push("#{VERT} #{row[:guess].join(' ')} #{VERT} #{row[:keys].join(' ')} #{VERT}")
    end

    board_row.each_with_index do |row, index|
      puts TOP_ROW if index.zero?
      puts MIDDLE_ROW if index.between?(1, board_row.length - 1)
      puts row
      puts BOTTOM_ROW if index == board.length - 1
    end
  end
end
