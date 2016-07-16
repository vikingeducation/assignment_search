#this knight just moves to a certain depth, instead of optimizing

Move = Struct.new(:x, :y, :depth, :children, :parent)
# class Move

#   def to_s
#     if children.size > 0 
#       "#{x}, #{y}:\n #{children}"
#     else
#       "#{x}, #{y}\n"
#     end
#   end

#   def inspect
#     if children.size > 0 
#       "#{x}, #{y}\n"
#     else
#       "#{x}, #{y}\n"
#     end
#   end

# end

class MoveTree

  attr_reader :coordinates, :depth, :root, :max_depth
  def initialize(coordinates, depth)
    starting_point = Move.new(coordinates[0], coordinates[1], 0, [], [])
    @max_depth = depth
    @root = starting_point
    @directions = [[2,1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    @visited_coordinates = {}
    build_tree
  end


  def build_tree
  current_node = @root
  stack_arr = []
  stack_arr.push(current_node)
    while current_node = stack_arr.shift
      populate(current_node)
      current_node.children.each do |child|
        stack_arr.push(child)
      end
    end

  end

  def populate(current_node)
    possible_moves = find_next_move(current_node)
    return false if possible_moves.empty?
    # binding.pry
    possible_moves.each do |move|
      current_node.children << move
    end
  end

  def find_next_move(current_node)
    possible_moves = []
    next_coordinates(current_node).each do |next_x, next_y|
      if valid_move?(next_x, next_y) && current_node.depth < @max_depth
        possible_moves << Move.new(next_x, next_y, current_node.depth + 1, [], current_node)
        @visited_coordinates[[next_x, next_y]] = "Hooray!"
      end
    end
    possible_moves
  end

  def next_coordinates(current_node)
    @directions.map {|x,y| [current_node.x + x, current_node.y + y]}
  end

  # def not_visited?(next_x, next_y)
  #   !@visited_coordinates.include?([next_x, next_y])
    
  # end


  def valid_move?(next_x, next_y)
    next_x >= 0 && next_x < 8 && next_y >= 0 && next_y < 8
  end



end

t = MoveTree.new([2, 2], 4)
