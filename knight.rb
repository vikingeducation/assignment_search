#psuedocode knights
# start tree(root) at whatever position
# iterate through possible nexst moves and add those as children to root
# => move qualifies if position (x,y) + (+-2, +-1) or (+-1, +-2) > -1 && < 5
# =>  add next qualifying move to be child of that node if node hasn't been visitited
# =>  continue process until no more moves
# =>  if no moves available, go to starting position's next child node (DFS)

Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  attr_reader :coordinates, :depth, :root
  def initialize(coordinates, depth)
    starting_point = Move.new(coordinates[0], coordinates[1], 0, [], nil)
    @max_depth = depth
    @root = starting_point
    @directions = [[2,1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    populate(starting_point)
    @root.children.each {|child| print "#{child.x}, #{child.y}\n" }
  end

  def build_tree
    =begin
    current_node = @root
    stack_arr = []
    stack_arr.push(current_node)
    until stack_arr.empty?
      populate(current_node)
      until stack_arr
      current_node.children.each do |child|
          stack_arr.push(child)
      end
      stack_arr.shift
      current_node = stack_arr[0]

    =end

    until current_node.depth == @max_depth
      return


  end

  def populate(current_node)
    possible_moves = find_next_move(current_node)
    return false if possible_moves.empty?
    possible_moves.each do |move|
      current_node.children << move
    end
  end

  def find_next_move(current_node)
    possible_moves = []
    @directions.each do |direction|
      if valid_move?(current_node, direction)
        possible_moves << Move.new(current_node.x + direction[0], current_node.y + direction[1], current_node.depth + 1, nil, current_node)
      end
    end
    possible_moves
  end

  def valid_move?(current_node, direction)
    current_node.x + direction[0] >= 0 && current_node.x + direction[0] < 5 && current_node.y + direction[1] >= 0 && current_node.y + direction[1] < 5
  end



end


t = MoveTree.new([2, 2], 1)
