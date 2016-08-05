require 'pry-byebug'
Move = Struct.new(:x, :y, :depth, :children, :parent) do
  def initialize(*)
    super
    self.children = []
  end
end

MOVE_DIRECTION = [
  [1,  2],
  [1, -2],
  [2,  1],
  [2, -1],
  [-1, 2],
  [-1,-2],
  [-2, 1],
  [-2,-1]
]

class MoveTree
  attr_accessor :root
  def initialize cood, max_depth = 5
    @root = Move.new(cood[0], cood[1], 0)
    @current = @root
    @max_depth = max_depth
    @counter = 1
    populate_nodes
  end

  def populate_nodes
    # binding.pry
    queue = []
    while @current.depth < @max_depth
      child_nodes @current
      @current.children.each do |child|
        queue << child
        @counter += 1
      end
      @current = queue.shift
    end
  end

  def inspect
    puts "Your tree has #{@counter} Move nodes and a maximun depth of #{@max_depth}"
  end

  def add_connect(parent_node, child_node)
    parent_node.children << child_node
    child_node.parent = parent_node
  end

  def child_nodes parent_node
    all_coods = child_coods( parent_node )
    all_coods.each do |cood|
      new_node = Move.new(cood[0], cood[1], parent_node.depth + 1)
      add_connect(parent_node, new_node)
    end
    parent_node
  end

  def child_coods parent_node
    all_coods = []
    MOVE_DIRECTION.each do |pos|
      x, y = [pos[0] + parent_node.x, pos[1] + parent_node.y]
      if in_bound? [x, y]
        all_coods << [x, y]
      end
    end
    all_coods
  end

  def in_bound? cood
    true if cood[0].between?(1, 5) && cood[1].between?(1, 5)
  end
end
