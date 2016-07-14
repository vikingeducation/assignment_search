Move = Struct.new(:x, :y, :depth, :children, :parent)

VECTORS = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

class MoveTree

  attr_reader :starting_pos

  def initialize(starting, max_depth)
    @starting_pos = Move.new(starting[0], starting[1])
    @max_depth = max_depth
  end

  def build_move(x, y)
    Move.new(x, y)
  end

  def build_trees(starting_pos)
    moves = moves_array([starting_pos.x, starting_pos.y])
    moves.map! do |move|
      Move.new(move[0], move[1])
    end
    moves.each do |move|
      add_move(move, starting_pos)
    end
  end

  def build_to_depth(move)
    # call build_trees, passing in a new move object created from each child's x, y pair 
    (@max_depth - 1).times do |index|
      build_trees(move)
      move.children.each do |child|
        build_trees(child)
      end
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
    possible_moves.select {|move| move[0] < 7 && move[1] < 7 && move[0] >= 0 && move[1] >= 0 }
  end

end
