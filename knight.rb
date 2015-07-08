Square = Struct.new(:x,:y,:depth, :children)

class MoveTree

  def initialize(init_x = 0, init_y = 0, max_depth = 1)    #board top left corner
    @max_depth = max_depth
    @depth = 0
    @head = Square(init_x, init_y, depth, [])
    construct_nodes(@head)

  end

  def construct_nodes(parent)
    @depth +=1
    if @depth <= @max_depth
      create_moves(parent)
      create_children(valid_moves, parent)
    end

  end

  def create_moves(square)
    moves_arr = []
    [-2,-1,1,2].each do |x|
      [-2,-1,1,2].each do |y|
        if abs(x + y)==3
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
    valid_moves
  end

  def create_children(valid_moves, parent)
    valid_moves.each do |move|
      parent.children << Square.new(move[0], move[1], @depth, [])
    end
  end


  def inspect


  end


end