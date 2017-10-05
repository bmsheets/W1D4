require_relative 'tile.rb'

class Board

  attr_reader :grid, :num_bombs, :num_active_bombs

  def initialize(num_bombs = 20)
    @num_bombs = num_bombs
    @num_active_bombs = num_active_bombs
    @grid = Array.new(9) { Array.new(9) }
  end

  def populate_grid
    deck = []
    num_bombs.times { deck << true }
    (81 - num_bombs).times { deck << false }
    deck = deck.shuffle
    grid.length.times do |i|
      grid.length.times do |j|
        grid[i][j] = Tile.new([i, j], deck.pop, self)
      end
    end
  end

  def render
    puts "  0 1 2 3 4 5 6 7 8"
    grid.length.times do |i|
      print "#{i} "
      grid.length.times do |j|
        print grid[i][j].to_s
      end
      puts ""
    end
  end

  def won?
  end

  def [](pos)
    i, j = pos
    grid[i][j]
  end

  def []=(pos, val)
    i, j = pos
    grid[i][j] = val
  end
end

board = Board.new
board.populate_grid
board.render
