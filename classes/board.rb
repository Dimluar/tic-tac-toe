# frozen_string_literal: false

# Game board
class Board
  attr_reader :winner

  def initialize
    @elements = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @chars = []
  end

  def add_char(player)
    chars.push(player.character)
  end

  def display_board
    puts <<-BOARD

     #{elements[0]} | #{elements[1]} | #{elements[2]}
    ---+---+---
     #{elements[3]} | #{elements[4]} | #{elements[5]}
    ---+---+---
     #{elements[6]} | #{elements[7]} | #{elements[8]}

    BOARD
  end

  def change_board(player, position)
    elements[position] = player.character
  end

  def set_game_over
    set_winner
    @winner = 'none' if @winner.nil? && full?
    nil
  end

  private

  attr_accessor :elements
  attr_reader :chars
  attr_writer :winner

  WIN_POSITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def full?
    elements.all? { |element| element.is_a?(String) }
  end

  def won?(char)
    won = false
    moves = elements.each_index.select { |index| elements[index] == char }

    WIN_POSITIONS.each do |win_position|
      moves.combination(3).to_a.each do |move|
        won = true if move == win_position
      end
    end
    won
  end

  def set_winner
    chars.each.with_index do |char, indx|
      return @winner = indx if won?(char)
    end
    nil
  end
end
