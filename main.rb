# frozen_string_literal: true

require_relative './lib/stylable'
require_relative './lib/game'

# Activating Monkey Patch so that CLI can have colored text
String.include Stylable::String

Game.new.play
