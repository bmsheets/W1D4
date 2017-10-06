class Tile

  attr_reader :is_bomb, :is_flagged, :is_revealed, :pos, :board

  def initialize(pos, is_bomb = false, board)
    @board = board
    @pos = pos
    @is_bomb = is_bomb
    @is_flagged = false
    @is_revealed = false
  end

  def reveal
    @is_revealed = true unless is_revealed || is_flagged
  end

  def toggle_flag
    if @is_flagged
      @is_flagged = false
    elsif !@is_revealed
      @is_flagged = true
    end
  end

  def neighbors
    neighbors = []
    x, y = pos
    (-1..1).each do |i|
      (-1..1).each do |j|
        next if i == 0 && j == 0
        new_x = x + i
        new_y = y + j
        next if !(0..8).cover?(new_x) || !(0..8).cover?(new_y)
        pos = new_x, new_y
        neighbors << board[pos]
      end
    end
    neighbors
  end

  def to_s
    return "F " if is_flagged
    #return " " if neighbor_bomb_count == 0
    return "* " if is_bomb && is_revealed
    return "#{neighbor_bomb_count} " if is_revealed
    "  "
    #return "*"
  end

  def neighbor_bomb_count
    count = 0
    neighbors.each do |neighbor|
      if neighbor.is_bomb
        count += 1
      end
    end
    count
  end
end
