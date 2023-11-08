# frozen_string_literal: false

require_relative 'player'
require_relative 'board'

# Game motor
class Game
  def initialize
    @players = []
  end

  def play; end

  private

  attr_accessor :players, :winner_id, :turn

  def create_players
    welcome_msg(1)
    name = gets.chomp
    char = select_character
    players.push Player.new(name, char)

    welcome_msg(2)
    name = gets.chomp
    char = select_character(char)
    players.push Player.new(name, char)
  end

  def welcome_msg(number)
    puts "\nWelcome! Player #{number}! How may I call you?"
  end

  def select_character(used_char = '')
    char = ''
    puts "\nWhich character would u like to use for the game?"
    until char.length == 1 && char != used_char
      char = gets.chomp
      puts 'Must be only one character!' unless char.length == 1
      puts 'That one is already in use!' if char == used_char
    end
    char
  end

  def select_first_turn
    @turn = rand(0..1)
  end

  def turn_msg(turn_number)
    puts "It's your turn #{players[turn_number].name}:"
  end
end

game = Game.new
game.play
