Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  
  MOVEMENT_VECTORS = [ 
                       [1,2], [1,-2], [-1,2], [-1,-2],
                       [2,1], [2,-1], [-2,1], [-2,-1]
                     ]

  attr_reader :max_depth

  def initialize(starting_position, max_depth = 1)
    @max_depth = max_depth
    @starting_position = [0,0]
    @queue = []
  end

  def inspect 
    # Your tree has 9 move nodes and a max depth of 1
  end

  def move_nodes(node, target_value)
    return print_statistics if [node.x, node.y] == target_value
    return "Your target not found" if node.depth > max_depth

    # if root, make new node
    # node = Move.new(node.x, node.y, 0, [], nil) if depth_count == 0

    possible_move_count += child_count
    possible_move_count
  end

  def record_children(node)
    # Setting and setting children
    child_count = 0
    MOVEMENT_VECTORS.each do |vector|
      possible_move = add_vectors([node.x, node.y], vector)

      # make new move struct at cood, parent current node
      move_struct = Move.new(possible_move[0], possible_move[1], depth_count, nil, node)

      # set parent nodes children as these add() results
      node.children << move_struct

      queue << move_struct
      child_count += 1 unless off_board?(possible_move)
    end
    child_count
  end

  def print_statistics
    puts "Whoopee!"
  end

  def branch_out(target_value)
    # max depth logic goes here
    4.times do
      while !@queue.empty?
        move_nodes(queue.unshift, target_value)
      end
    end
  end

  def add_vectors(position, vector)
    [position[0] + vector[0], position[1] + vector[1]]
  end

  def off_board?(position)
    x = position[0]
    y = position[1]

    x > 4 || x < 0 || y > 4 || y < 0
  end

end