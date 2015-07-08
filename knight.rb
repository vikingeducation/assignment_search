Square = Struct.new(:x,:y,:depth, :children)

class MoveTree 

  attr_reader :head

  def initialize(init_x = 0, init_y = 0, max_depth = 1)

    @max_depth = max_depth
    @depth = 0
    @head = Square.new(init_x, init_y, @depth, [])
    construct_nodes(@head)

  end

  def construct_nodes(parent)

    while @depth < @max_depth
      @depth +=1
      valid_moves = create_moves(parent)
      new_parent_array = create_children(valid_moves, parent)

      #recursion
      new_parent_array.each do|new_parent| construct_nodes(new_parent)
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
      # puts moves_arr.inspect
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

  def create_children(valid_moves, parent)
    valid_moves.each do |move|
      parent.children << Square.new(move[0], move[1], @depth, [])
    end
    parent.children #[sq1, sq2]
  end

  def inspect

    print @head.inspect

    @depth.times do
     #  @head +
     #  @head.children.lenght
     #  each children 
     #   children.lenght
     # end


    end


  end


end