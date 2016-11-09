
#Move = Struct.new(:x, :y, :depth, :children, :parent)

require_relative 'move'

class MoveTree

  def initialize(coordinates, max_depth)
    @coordinates = coordinates
    @max_depth   = max_depth
    @upper_limit = 7
    @lower_limit = 0
    @left_limit  = 0
    @right_limit = 7
  end

  def moves_from(coordinates = @coordinates, max_depth = @max_depth)
    # construct tree of nodes (moves) from a given position
    x, y = coordinates
    current_node = Move.new(x, y, nil, nil)
    current_depth = 0
    while current_depth < max_depth
      move_posibilities.each do |position_delta|
        unless out_of_bounds(current_node, position_delta)
        end
      end
    end
  end

  def move_posibilites
    [[-1, 2], [1, 2], [2, 1], [2, -1],
     [1, -2], [-1, -2], [-2, 1], [-2, -1], ]
  end

  def out_of_bounds(start, delta)
    delta_x, delta_y = position_delta
    x + delta_x > @right_limit ||
  end

end
