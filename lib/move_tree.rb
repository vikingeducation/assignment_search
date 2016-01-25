# This is just one way to represent a Move node
# The `parent` attribute will come in handy later...
# some_move = Move.new(:x, :y, :depth, :children, :parent)

=begin
  1. Set up a very basic MoveTree class (as in, "a tree of moves"). (DONE)

  2. It should construct a tree of potential moves from a given position by using a series of Move structs.

  3. It should take two inputs -- a coordinate pair to represent the starting position and a max_depth value which prevents the tree from continuing infinitely large. (DONE)

  4. It's okay to repeat positions in different subtrees but you cannot go off the board.

  5. It's easiest to start with your max_depth at 1 to make sure everything's working properly before generating a larger tree like 10 or 20.

  Note: Do NOT use recursion unless you are feeling like an expert at it. As you've learned, there is always a different (and easier to debug) way to solve a recursive problem.

  !!!!!!!!!!!!!!!!!!tree = MoveTree.new([3,3], 1)!!!!!!!!!!!!
=end

Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

  attr_reader :root_node

  def initialize(starting_position, max_depth)
    @max_depth = max_depth
    @starting_position = starting_position
    @number_of_nodes = 1
    @root_node = Move.new(starting_position[0], starting_position[1], 0, [], nil)
    create_children(@root_node)
  end

  def create_children(node)
    # First we want to create the children for that node.
    add_child_top_right(node) if node.x < 7 && node.y < 6
    add_child_right_top(node) if node.x < 6 && node.y < 7
    add_child_right_bottom(node) if node.x < 6 && node.y > 0
    add_child_bottom_right(node) if node.x < 7 && node.y > 1
    add_child_top_left(node) if node.x > 0 && node.y < 6
    add_child_bottom_left(node) if node.x > 0 && node.y > 1
    add_child_left_bottom(node) if node.x > 1 && node.y > 0
    add_child_left_top(node) if node.x > 1 && node.y < 7
    # Then we want to create the children for those children.
    node.children.each do |child|
      create_children(child) if child.depth < @max_depth
    end
  end

  def add_child_top_left(node)
    node.children << Move.new(node.x-1, node.y+2, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_top_right(node)
    node.children << Move.new(node.x+1, node.y+2, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_right_top(node)
    node.children << Move.new(node.x+2, node.y+1, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_right_bottom(node)
    node.children << Move.new(node.x+2, node.y-1, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_bottom_right(node)
    node.children << Move.new(node.x+1, node.y-2, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_bottom_left(node)
    node.children << Move.new(node.x-1, node.y-2, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_left_bottom(node)
    node.children << Move.new(node.x-2, node.y-1, node.depth+1, [], node)
    @number_of_nodes += 1
  end

  def add_child_left_top(node)
    node.children << Move.new(node.x-2, node.y+1, node.depth+1, [], node)
    @number_of_nodes += 1
  end

=begin
Write a simple inspect method for the MoveTree class so you can output the key aspects of your tree in a way which makes sense, for instance its total number of nodes and max depth. Note: Please don't overthink this. There is a dead-simple way to do it which doesn't involve writing any new processes.
knight_tree.inspect
#=> Your tree has 9 Move nodes and a maximum depth of 1.
=end

  def inspect
    puts "Your tree has #{@number_of_nodes} Move nodes and a maximum depth of #{@max_depth}"
  end

end

MoveTree.new([0,0],7).inspect