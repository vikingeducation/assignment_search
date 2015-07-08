Square = Struct.new(:x,:y,:depth, :children)

class MoveTree 

  def initialize(init_x = 0, init_y = 0, max_depth = 1)

    @max_depth = max_depth
    @depth = 0
    @head = Square(init_x, init_y, depth, [])
    construct_nodes(@head)

  end

  def construct_nodes(parent)
    #a knight moves 2 sq in one direction and then 1 l/r
    #board 8x8

    @depth +=1

    if @depth <= @max_depth
      create_legal_moves(parent)
      validate_legal_moves
      create_children
    end

  end

    



  def inspect


  end


end