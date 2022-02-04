# frozen_string_literal: true

require_relative 'stylable/string'
require_relative 'stylable/board'

# This module provides the tools to create and style a board game for the CLI
module Stylable
  def self.clear_screen
    print "\e[2J\e[H"
  end

  def self.next_page
    print "\nPress 'ENTER' to continue ".cyan
    key = $stdin.noecho(&:gets)

    key = $stdin.noecho(&:gets) until key == "\n"

    Stylable.clear_screen
  end

  def self.line_separator
    puts "\n-------------------------".cyan
  end
end
