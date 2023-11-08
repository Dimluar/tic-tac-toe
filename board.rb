# frozen_string_literal: false

# Game board
class Board
  def initialize
    @elements = [0, 1, 2, 3, 4, 5, 6, 7, 8]
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

  def change_board(char, position)
    elements[position] = char
  end

  private

  attr_accessor :elements

  WIN_POSITIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 5, 6]
  ].freeze
end
