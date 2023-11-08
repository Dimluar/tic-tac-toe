# frozen_string_literal: false

# Game motor
class Game
  def initialize
    @players = []
  end

  private

  attr_accessor players, winner_id
end
