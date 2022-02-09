# frozen_string_literal: true

require_relative 'stylable'

# This class defines actions that the game board takes during a game session of Mastermind
class Board
  attr_reader :board, :guess_num

  include Stylable::Board

  def initialize(rows)
    @board = []
    board_creator(rows)
  end

  def board_creator(rows)
    rows.times { @board.push({guess: Array.new(4, EMPTY_COLOR), keys: Array.new(4, EMPTY_KEY)}) }
  end

  def peg_colors(color_num)
    {
      '1' => COLOR_PEG.yellow,
      '2' => COLOR_PEG.blue,
      '3' => COLOR_PEG.purple,
      '4' => COLOR_PEG.green,
      '5' => COLOR_PEG.cyan,
      '6' => COLOR_PEG.red
    }[color_num]
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

  def update_guess_row(guess, guess_num)
    guess.each_with_index do |num, index|
      @board[guess_num][:guess][index] = "#{peg_colors(num)} "
    end
  end

  def update_key_row(keys, guess_num)
    keys.each_with_index do |key, index|
      @board[guess_num][:keys][index] = key
    end
  end
end
