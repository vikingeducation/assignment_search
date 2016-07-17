Move = Struct.new(:x, :y, :depth, :parent, :children)

VECTORS = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

class MoveTree

  attr_reader :starting_pos, :children

  def initialize(starting, max_depth)
    @starting_pos = Move.new(starting[0], starting[1], 1)
    @max_depth = max_depth
    @children = 0
  end

  def build_move(x, y)
    Move.new(x, y)
  end

  def build_trees
    queue = [@starting_pos]
    while mv = queue.shift
      break if mv.depth == @max_depth
      parent = mv
      moves = moves_array([mv.x, mv.y])
      moves.map! do |move|
        Move.new(move[0], move[1], (parent.depth + 1))
      end
      moves.each do |move|
        add_move(move, mv)
        @children += 1
      end
      mv.children.each { |child| queue << child }
    end
  end

  def add_move(move, parent)
    if parent.children
      parent.children << move
    else
      parent.children = []
      parent.children << move
    end
    move.parent = parent
  end

  def moves_array(starting_pos)
    x = starting_pos[0]
    y = starting_pos[1]
    possible_moves = []
    VECTORS.each do |move|
      possible_moves << [x + move[0], y + move[1]]
    end
    # iterate through possible_moves, removing any x,y pair in which either x or y is greater than 7 or less than 0
    possible_moves.select {|move| move[0] <= 7 && move[1] <= 7 && move[0] >= 0 && move[1] >= 0 }
  end

end
