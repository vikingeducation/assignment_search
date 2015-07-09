require 'pry'

Square = Struct.new(:x,:y,:depth, :children)

class MoveTree
  attr_reader :head, :children, :count_of_nodes
  def initialize(init_x = 0, init_y = 0, max_depth = 1)    #board top left corner
    @max_depth = max_depth
    depth = 0
    @count_of_nodes = 1
    @head = Square.new(init_x, init_y, depth, [])
    construct_nodes(@head, depth)

  end

  def construct_nodes(parent, depth)
    if depth < @max_depth
      valid_moves = create_moves(parent)
      new_parent_array = create_children(valid_moves, parent, depth)
      #recursion
      new_parent_array.each do |new_parent|
        construct_nodes(new_parent, depth+1)
      end
    end
  end

  def create_moves(square)
    moves_arr = []
    [-2,-1,1,2].each do |x|
      [-2,-1,1,2].each do |y|
        if (x.abs + y.abs) == 3
          moves_arr << [square.x+x, square.y+y]
        end
      end
    end
      validate_legal_moves(moves_arr)
  end

  def validate_legal_moves(moves)
    valid_moves = []
    moves.each do |move|
      if (0..7).include?(move[0]) && (0..7).include?(move[1])
          valid_moves << move
      end
    end
    puts valid_moves.inspect
    valid_moves
  end

  def create_children(valid_moves, parent, depth)
    valid_moves.each do |move|
      parent.children << Square.new(move[0], move[1], depth, [])
      @count_of_nodes += 1
    end
    parent.children #[sq1, sq2]
  end

  def inspect_nodes
    @count_of_nodes
  end
end


class KnightSearcher

  def initialize(tree)
    @tree_input = tree
    @head = tree.head
  end

  def bfs_for(target_coords)
    x = target_coords[0]
    y = target_coords[1]
    moves = []
    if [@head.x, @head.y] == target_coords
      moves << @head.x, @head.y
    end
    else
      @head.children.each
    end
  end

end
















