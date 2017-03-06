# find the exact sequence of moves required to get from any given
# square to another square on the board
# 8x8

Move = Struct.new("Move", :x, :y, :depth, :children, :parent)

# Set up a very basic MoveTree class (as in, "a tree of moves").
# It should construct a tree of potential moves from a given position by using
# a series of Move structs.
# It should take two inputs -- a coordinate pair to represent the starting
# position and a max_depth value which prevents the tree from
# continuing infinitely large [ok]

class MoveTree
  attr_accessor :axis, :max_depth, :root

  def initialize(axis, max_depth)
    @axis = axis
    @max_depth = max_depth
    @root = MoveTree.build_tree!(Move.new(axis[0], axis[1], 0), 0, max_depth)
  end

  # ---------------------------------------------------------------
  # Access
  # ---------------------------------------------------------------

  def children
    root.children
  end

  def x
    root.x
  end

  def y
    root.y
  end

  # ---------------------------------------------------------------
  # Class Methods
  # ---------------------------------------------------------------

  def self.knight_moves
    [
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [-1, 2], [1, -2], [-1, -2]
    ]
  end

  def self.moves_for(parent, depth)
    MoveTree.knight_moves.map do |move|
      to_x, to_y = move
      Move.new(parent.x - to_x, parent.y - to_y, depth, nil, parent)
    end.select do |move|
      MoveTree.within_board_limits?(move.x, move.y)
    end
  end

  def self.build_tree!(parent, depth, max_depth)
    return parent if depth == max_depth
    if parent.children.nil?
      depth += 1
      parent.children = MoveTree.moves_for(parent, depth)
      MoveTree.build_tree!(parent, depth, max_depth)
    else
      parent.children.each do |node|
        MoveTree.build_tree!(node, depth, max_depth)
      end
      parent
    end
  end

  def self.within_board_limits?(x, y)
    x >= 0 && x <= 7 &&
    y >= 0 && y <= 7
  end

  def self.length(tr)
    if tr.children
      tr.children.length + tr.children.map{ |c| MoveTree.length(c) }.sum
    else
      0
    end
  end

  # ---------------------------------------------------------------
  # Instance Methods
  # ---------------------------------------------------------------

  def length
    MoveTree.length(root) + 1
  end

  def depth
    d = 0
    parent = root
    while true
      break if parent.children.nil?
      d += 1
      parent = parent.children[0]
    end
    d
  end

  def inspect
    "Your tree has #{length} Move nodes and a maximum depth of #{depth}"
  end

end
