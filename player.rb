# frozen_string_literal: false

# Game players
class Player
  attr_reader :name, :char, :id

  def initialize(id, name, char)
    @id = id
    @name = name
    @character = char
    @its_turn = false
  end
end
