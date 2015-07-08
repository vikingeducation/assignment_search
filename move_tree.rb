Square = Struct.new(:x,:y,:depth,:children)

class MoveTree

  @@BOARD_SIZE = 5

  def initialize(start_position, max_depth)
    @root = Square.new(start_position[0], start_position[1], 0, [])
    @current_depth = 0
    until (current_depth >= max_depth)
      generate_next_generation
      @current_depth += 1
    end
  end

  # def generate_next_generation
  #   if @current_depth == 0
  #     generate_children(@root)
  #   else
  #     parents = get_current_generation(@root, @current_depth)
  #     parents.each do |parent|
  #       generate_children(parent)
  #     end
  #   end
  # end

  def generate_next_generation(parent)
    unless parent.children.empty?
      parent.children.each do |child|
        generate_next_generation(child)
      end
    else
      parent.generate_children
    end
  end

  def get_current_generation(parent, num)
    if num == 0
      return parent.children
    else
      all_children = []
      parent.children.each do |child|
        all_children << get_current_generation(child, num - 1)
      end
      return all_children
    end
  end

  # def generate_children(parent)
  #   parent.children.each do |child|
  #     generate_root(child)
  #   # current_depth.times do |ctr|
      
  #   end
  # end

  def generate_children(parent)
    get_moves(parent.x,parent.y).each do |move|
      parent.children << Square.new(move[0],move[1], @current_depth, [])
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