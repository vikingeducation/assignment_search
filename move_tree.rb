Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  attr_reader :coords, :max_depth, :root, :depth

  def initialize(coords, max_depth=1)
    @root = Move.new(coords[0], coords[1], 0, [], nil)
    @max_depth = max_depth
    @current_node = @root
    @count = 1
    create_moves
  end

  def create_moves
    queue = []
    depth = @count - 1
    while @current_node.depth < @max_depth
      get_children(@current_node)
      @current_node.children.each do |n|
        queue << n
        @count += 1
      end
      @current_node = queue.shift
    end
  end

  def get_children(parent)
    moves = within_board?([parent.x, parent.y])
    moves.each do |coords|
      new_node = Move.new(coords[0], coords[1], parent.depth + 1, [], parent)
      add_parent(@current_node, new_node)
    end
    return parent
  end

  def add_parent(parent, new_node)
    parent.children << new_node
    new_node.parent = parent
  end

  def within_board?(move)
    x = move[0]
    y = move[1]
    moves = []
    array = [[x + 2, y - 1], [x + 2, y + 1],
             [x + 1, y - 2], [x - 1, y - 2],
             [x - 2, y + 1], [x - 2, y - 1],
             [x - 1, y + 2], [x + 1, y + 2]]
    array.each do |coords|
      moves << coords if valid_move?(coords)
    end
    return moves
  end

  def valid_move?(coords)
    return true if coords[0].between?(0, 7) && coords[1].between?(0, 7)
  end

  def inspect
    puts "# Your tree has #{@count} Move nodes and a maximum depth of #{@max_depth}."
  end

end