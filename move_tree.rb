some_move = Move.new(:x, :y, :depth, :children, :parent)

class MoveTree
  def initialize(coords, max_depth)
    @x = coords[0]
    @y = coords[1]
    @max_depth = max_depth
    @board = Array.new(8) {Array.new(8)}
  end

  def potential_moves
    valid_moves = []
    if @board.include[@x - 2][@y + 1]
      @top_left = @board[@x - 2][@y + 1]
      valid_moves << @top_left
    end
    if @board.include[@x - 1][@y + 2]
      @left_top = @board[@x - 1][@y + 2]
      valid_moves << @left_top
    end
    if @board.include[@x + 1][@y + 2]
      @left_bot = @board[@x + 1][@y + 2]
      valid_moves << @left_bot
    end
    if @board.include[@x + 2][@y + 1]
      @bot_left = @board[@x + 2][@y + 1]
      valid_moves << @bot_left
    end
    if @board.include[@x + 2][@y - 1]
      @bot_right = @board[@x + 2][@y - 1]
      valid_moves << @bot_right
    end
    if @board.include[@x + 1][@y - 2]
      @right_bot = @board[@x - 1][@y - 2]
      valid_moves << @right_bot
    end
    if @board.include[@x - 1][@y - 2]
      @right_top = @board[@x - 2][@y + 1]
      valid_moves << @right_top
    end
    if @board.include[@x - 2][@y - 1]
      @top_right = @board[@x - 2][@y - 1]
      valid_moves << @top_right
    end
    @real_moves = valid_moves.length
  end

  def inspect
    puts "Your tree has #{real_moves} move nodes and a depth of #{depth}."
  end

end
