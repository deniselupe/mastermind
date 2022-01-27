# frozen_string_literal: true

require_relative './lib/stylable'
require_relative './lib/board'
require_relative './lib/game'

String.include Stylable::String

Game.new.play
