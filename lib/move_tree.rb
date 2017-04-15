# This is just one way to represent a Move node
# The `parent` attribute will come in handy later...
Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

attr_accessor :starting_pos, :max_depth, :root, :moves, :total_nodes

  def initialize(starting_pos, max_depth = 1)
    @starting_pos = starting_pos
    @max_depth = max_depth
    @root = Move.new(@starting_pos[0], @starting_pos[1], 0, [], nil)
    @total_nodes = 0

    build_tree(@root)
  end

  # Possible moves a knight can make
  def possible_moves(x, y)
    @moves = [[x+1,y+2], [x+1,y-2],
             [x-1,y+2], [x-1,y-2],
             [x+2,y+1], [x+2,y-1],
             [x-2,y+1], [x-2,y-1]]

  end

  
  def build_tree(head, depth=0)
    # Build a tree of possible moves based on the valid moves
    unless depth > @max_depth
      create_child_nodes(head, depth)
      head.children.each do |child|
        build_tree(child, depth+1)
      end
    end
  end

  def create_child_nodes(current_node, depth)
    possible_moves(current_node.x, current_node.y)
    @moves.each do |coords|
      if (0..4).include?(coords[0]) && (0..4).include?(coords[1]) 
        new_node = Move.new(coords[0], coords[1], depth+1, [], current_node)
        current_node.children << new_node
        @total_nodes += 1
      end
    end
  end

  def inspect
    puts "Your tree has #{@total_nodes} Move nodes and a maximum depth of #{@max_depth}"
  end
end