#psuedocode knights
# start tree(root) at whatever position
# iterate through possible nexst moves and add those as children to root
# => move qualifies if position (x,y) + (+-2, +-1) or (+-1, +-2) > -1 && < 5
# =>  add next qualifying move to be child of that node if node hasn't been visitited
# =>  continue process until no more moves
# =>  if no moves available, go to starting position's next child node (DFS)
require 'pry'

Move = Struct.new(:x, :y, :depth, :children, :parent)
class Move

  def to_s
    "#{x}, #{y}:\n #{children}"
  end

  def inspect
    "#{x}, #{y}:\n #{children}"
  end

end

class MoveTree

  attr_reader :coordinates, :depth, :root
  def initialize(coordinates, depth)
    starting_point = Move.new(coordinates[0], coordinates[1], 0, [], [])
    @max_depth = depth
    @root = starting_point
    @directions = [[2,1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    @visited_coordinates = {}
    build_tree
    # @root.children[0].children[0].children[0].children.each do |child|
    #   puts "#{child.x}, #{child.y}\n"
    puts @root
  end


  def build_tree
  current_node = @root
  stack_arr = []
  stack_arr.push(current_node)
    # until stack_arr.empty?
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
      if valid_move?(next_x, next_y) && not_visited?(next_x, next_y)
        possible_moves << Move.new(next_x, next_y, current_node.depth + 1, [], current_node)
        @visited_coordinates[[next_x, next_y]] = "Hooray!"
      end
    end
    possible_moves
  end

  def next_coordinates(current_node)
    @directions.map {|x,y| [current_node.x + x, current_node.y + y]}
  end

  def not_visited?(next_x, next_y)
    !@visited_coordinates.include?([next_x, next_y])
    
  end


  def valid_move?(next_x, next_y)
    next_x >= 0 && next_x < 5 && next_y >= 0 && next_y < 5
  end



end


t = MoveTree.new([2, 2], 4)

