Move = Struct.new(:x, :y, :depth, :children, :parents)

class MoveTree
  attr_accessor :root, :children, :parents

  ALL_MOVES = [[1,2], [-1,2], [1,-2], [-1,-2], [2, 1], [-2,1], [2,-1], [-2,-1]]

  def initialize(coord_array, max_depth=4)
    @coord_array = coord_array
    @max_depth = max_depth
    @root = Move.new(coord_array[0], coord_array[1], 0, [], nil)
    @total_nodes_number = 0
    tree_builder
  end

  def inspect
    root_children = @root.children
    root_children.length {|idx| puts root_children[idx..idx+7] if root_children[idx] == "x" }
    puts "Your tree has #{@total_nodes_number } Move nodes and a maximum depth of #{@max_depth}."
  end

  private
  
  def add_child(current_node,x,y,depth)
    new_node = Move.new(x, y, depth, [], current_node)
    current_node.children << new_node
  end

  def build_child_nodes(current_node, depth)
    number_of_nodes = 0
    ALL_MOVES.each do |(x1,y1)|
      x, y = current_node.x + x1, current_node.y + y1
      if x <= 7 && x >= 0 && y <= 7 && y >= 0
        add_child(current_node, x, y, depth + 1)
        number_of_nodes += 1
      end
    end
    @total_nodes_number += number_of_nodes
  end

  def build_generation(parent_node, depth=0)
    return if depth > @max_depth
    build_child_nodes(parent_node, depth)
    parent_node.children.each do |child|
      build_generation(child, depth+1)
    end
  end

  def tree_builder
    build_generation(@root)
    self
  end


end