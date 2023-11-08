# frozen_string_literal: false

# Game players
class Player
  attr_reader :name, :char
  attr_writer :its_turn

  def initialize(name, char)
    @name = name
    @character = char
    @its_turn = false
  end
end
