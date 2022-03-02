# frozen_string_literal: true

require_relative './lib/game'

def replay
  print "\nWould you like to play again? (Y or N)\nResponse: ".cyan
  response = gets.chomp.upcase

  until response.match?(/^(YES|Y)$/) || response.match?(/^(NO|N)$/)
    Stylable.clear_screen
    puts "\nThat is not a valid response. Would you like to play again? (Y or N)"
    response = gets.chomp.upcase
  end

  if response.match?(/^(YES|Y)$/)
    Game.new.play_v2
    replay
  elsif response.match?(/^(NO|N)$/)
    puts "\nTHANK YOU FOR PLAYING! GOODBYE!".green
    sleep 2
    Stylable.clear_screen
  end
end

Game.new.play_v1
replay
