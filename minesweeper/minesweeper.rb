require_relative 'board.rb'

class Minesweeper

  attr_reader :board

  def play
    until game_over?
      play_turn
    end
  end

  def play_turn
  end

  def game_over?
  end

end
