require_relative 'square'
require_relative 'moves'

class MoveTree
  include Moves

  attr_reader :root, :max_depth, :num_of_nodes

  def initialize(coordinates,max_depth)
    @root = Square.new(coordinates[0],coordinates[1],0,nil,[])
    @max_depth = max_depth
    @num_of_nodes = 1
    attach_children(@root)
  end

  def attach_children(node)
    self.moves.each do |move|
      new_x = node.x + move[0]
      new_y = node.y + move[1]
      new_depth = node.depth + 1
      if on_the_board?([new_x,new_y])
        new_node = Square.new(new_x,new_y,new_depth,node,[])
        node.children << new_node
        @num_of_nodes += 1
        attach_children(new_node) if new_node.depth < max_depth
      end
    end
  end

  def inspect
    puts "This tree has #{num_of_nodes} nodes and a max depth of #{max_depth}."
  end
end