
#Move = Struct.new(:x, :y, :depth, :children, :parent)

require_relative 'move'

class MoveTree
  attr_reader :root 

  def initialize(coordinates, max_depth)
    #assumes input is valid, please please please. Thanks.
    @coordinates = coordinates
    @max_depth   = max_depth
    @upper_limit = 7
    @lower_limit = 0
    @left_limit  = 0
    @right_limit = 7
  end

  #just for kit, we were tempted to use recursion, but we stayed strong
  def moves_from(coordinates = @coordinates, max_depth = @max_depth)
    # construct tree of nodes (moves) from a given position
    x, y = coordinates
    current_depth = 0
    current_node = @root = Move.new(x, y, current_depth, [])
    while current_depth < max_depth
      x, y = current_node.x, current_node.y
      move_posibilities.each do |delta|
        unless out_of_bounds([x, y], delta)
          new_node = make_move_node(x, y, delta, current_depth)
          current_node.children << new_node
          new_node.parent = current_node
        end
      end
      current_depth += 1
    end
  end

  def make_move_node(x, y, delta, depth)
    delta_x, delta_y = delta
    Move.new(x + delta_x, y + delta_y, depth, [])
  end

  def move_posibilites
    [[-1, 2], [1, 2], [2, 1], [2, -1],
     [1, -2], [-1, -2], [-2, 1], [-2, -1], ]
  end

  def out_of_bounds(start, delta)
    x, y = start
    delta_x, delta_y = delta
    x + delta_x > @right_limit ||  x + delta_x < @left_limit ||
    y + delta_y > @upper_limit || y + delta_y < @lower_limit
  end

end
start = Move.new(0,0)
p MoveTree.new([0,0],1).out_of_bounds([0,0],[1,2])
