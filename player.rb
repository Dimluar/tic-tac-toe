# frozen_string_literal: false

# Game players
class Player
  attr_reader :name, :char

  def initialize(name, char)
    @name = name
    @character = char
  end
end
