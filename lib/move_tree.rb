# This is just one way to represent a Move node
# The `parent` attribute will come in handy later...
Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree

attr_accessor :starting_pos, :max_depth, :head

  def initialize(starting_pos, max_depth = 1)
    @starting_pos = starting_pos
    @max_depth = max_depth
    @head = Move.new(starting_pos[0], starting_pos[1], 0, [], nil)
    build_tree(starting_pos)
  end

  # Possible moves a knight can make
  def moves(curr)
    moves = [[curr[0]+1,curr[1]+2], [curr[0]+1,curr[1]-2],
             [curr[0]-1,curr[1]+2], [curr[0]-1,curr[1]-2],
             [curr[0]+2,curr[1]+1], [curr[0]+2,curr[1]-1],
             [curr[0]-2,curr[1]+1], [curr[0]-2,curr[1]-1]]

  end

  
  def build_tree(head, depth=0)

    # Build a tree of possible moves based on the valid moves
    unless depth > @max_depth
      create_child_nodes(head, depth)
      @head.children.each do |child|
        build_tree(child, depth+1)
      end
    end
  end

  def create_child_nodes(current_node, depth)
    moves.each do |coords|
      if (0..4).include?(coords[0]) && (0..4).include?(coords[1]) 
        new_node = Move.new(coords[0], coords[1], depth+1, [], current_node)
        current_node.children << new_node
      end
    end
  end

end