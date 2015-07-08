Square = Struct.new(:x,:y,:depth,:children)

class MoveTree

  @@BOARD_SIZE = 5

  def initialize(start_position, max_depth)
    @root = Square.new(start_position[0], start_position[1], 0, [])
    current_depth = 0
    until (current_depth >= max_depth)
      generate_next_generation(current_depth)
    end
  end

  def generate_next_generation(current_depth)
    if current_depth == 0
      generate_root
    else
      generate_children(current_depth)
    end
  end

  def generate_children(current_depth)
    current_depth.times do |ctr|
      
    end
  end

  def generate_root
    get_moves(@root.x,@root.y).each do |move|
      @root.children << Square.new(move[0],move[1], 1, [])
    end
  end

  def outbounds?(x,y)
    x > @@BOARD_SIZE || x < 0 || 0 > @@BOARD_SIZE || y < 0
  end

  def get_moves(x,y)
    moves = [[-2, -1],[-2,1],[2, 1],[2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    moves.map!{|sq| [sq[0] + x, sq[1] + y]}

    moves.reject!{|sq| outbounds(sq[0],sq[1])}

    moves
  end

end