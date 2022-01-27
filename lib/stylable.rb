# frozen_string_literal: true

# This modules provides the tools to create and style a board game for the CLI
module Stylable
  # This module monkey patches core class String by adding methods that manipulate text color
  module String
    def yellow
      "\e[93m#{self}\e[0m"
    end

    def blue
      "\e[94m#{self}\e[0m"
    end

    def purple
      "\e[95m#{self}\e[0m"
    end

    def green
      "\e[92m#{self}\e[0m"
    end

    def cyan
      "\e[96m#{self}\e[0m"
    end

    def red
      "\e[91m#{self}\e[0m"
    end

    def gray
      "\e[37m#{self}\e[0m"
    end

    def yellow_bg
      "\e[43m#{self}\e[0m"
    end

    def blue_bg
      "\e[44m#{self}\e[0m"
    end

    def purple_bg
      "\e[45m#{self}\e[0m"
    end

    def green_bg
      "\e[42m#{self}\e[0m"
    end

    def cyan_bg
      "\e[46m#{self}\e[0m"
    end

    def red_bg
      "\e[41m#{self}\e[0m"
    end
  end

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
  end
end
