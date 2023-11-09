# frozen_string_literal: false

require_relative 'player'
require_relative 'board'

# Game motor
class Game
  def initialize
    @players = []
    @ocuppaid_cells = []
  end

  def play
    create_players
    select_first_turn
    play_rounds
    game_over
  end

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
    @turn = rand(0..9) % 2
  end

  def turn_msg(turn_number)
    puts "\nIt's your turn #{players[turn_number].name}:"
  end

  def select_winner(board)
    @winner_id = board.winner
  end

  def game_over
    if winner_id == 'none'
      puts "\nOh! It's a tie! Better luck next time!"
    else
      puts "\nAnd #{players[winner_id].name} wins! Good game!"
    end
  end

  def increase_turn
    @turn = (@turn + 1) % 2
  end

  def move_msg
    puts 'Write the number of the cell you want to place your piece:'
  end

  def select_move
    move = ''
    move_msg
    until move.between?('0', '8') && !@ocuppaid_cells.include?(move.to_i)
      move = gets.chomp
      puts 'Introduce a valid value' unless move.between?('0', '8')
      puts 'Introduce a free cell' if @ocuppaid_cells.include?(move.to_i)
    end
    move
  end

  def use_move(board, move)
    move = move.to_i
    @ocuppaid_cells.push(move)
    board.change_board(players[turn], move)
    increase_turn
  end

  def add_char(board)
    players.each { |player| board.add_char(player) }
  end

  def play_rounds
    board = Board.new
    add_char(board)
    while board.winner.nil?
      turn_msg(turn)
      board.display_board
      use_move(board, select_move)
      board.set_game_over
    end
    board.display_board
    select_winner(board)
  end
end
