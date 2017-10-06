require_relative 'board.rb'

class Minesweeper

  attr_reader :board

  def play
    until game_over?
      play_turn
    end
  end

  def play_turn
    board.render
    pos = get_pos
    action = get_action
    result = perform_move(pos, action)
    display_result(result)
  end

  def get_pos
    print "Input position format 1,1: "
    input = gets.chomp
    until valid_input?
      print "Invalid input please try again: "
      input = gets.chomp
    end
    pos = input.split(",").map(&:to_i)
  end

  def get_action
    print "Input an action (Flag: F, Reveal: R)"
    input = gets.chomp
    until input == "F" || input == "A"
      input = gets.chomp
    end
    input
  end

  def valid_input?

  end

  def game_over?
  end

end
