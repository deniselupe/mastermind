# frozen_string_literal: true

# This module provides the tools to create and style a board game for the CLI
module Stylable
  # This module lists the different unicodes needed to create a game board
  module Board
    L_TOP_CORNER = "\u250c"
    R_TOP_CORNER = "\u2510"
    L_BOT_CORNER = "\u2514"
    R_BOT_CORNER = "\u2518"
    HOR = "\u2500"
    VERT = "\u2502"
    HOR_DOWN = "\u252c"
    HOR_UP = "\u2534"
    VERT_L = "\u251c"
    VERT_R = "\u2524"
    HOR_VERT = "\u253c"
    EMPTY_KEY = "\u25CB"
    KEY_PEG = "\u25CF"
    EMPTY_COLOR = "\u3007"
    COLOR_PEG = "\u2B24"
    TOP_ROW = "#{L_TOP_CORNER}#{HOR * 13}#{HOR_DOWN}#{HOR * 9}#{R_TOP_CORNER}"
    MIDDLE_ROW = "#{VERT_L}#{HOR * 13}#{HOR_VERT}#{HOR * 9}#{VERT_R}"
    BOTTOM_ROW = "#{L_BOT_CORNER}#{HOR * 13}#{HOR_UP}#{HOR * 9}#{R_BOT_CORNER}"
  end
end
