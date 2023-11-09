# frozen_string_literal: false

require_relative 'classes/game'

def play_game
  game = Game.new
  game.play
  sleep(3)
  replay_game
end

def replay_game?
  puts "\nReady for another round? -yes -no"
  awnser = ''
  until %w[yes no].include?(awnser)
    awnser = gets.chomp.downcase
    puts "\nPlease, awnser the question :')"
  end
  awnser == 'yes'
end

def replay_game
  awnser = replay_game?
  if awnser
    play_game
  else
    puts "\nIt's okay! Thanks for playing, hope you liked it!"
  end
end

puts "\n---TIC-TAC-TOE---"
play_game
