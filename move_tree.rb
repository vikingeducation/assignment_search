Square = Struct.new(:x,:y,:depth,:children)

class MoveTree

  attr_reader :root

  @@BOARD_SIZE = 8

  def initialize(start_position, max_depth)
    @played_moves = []
    @nodes = 1
    @root = Square.new(start_position[0], start_position[1], 0, [])
    @current_depth = 0
    until (@current_depth >= max_depth)
      generate_next_generation(@root)
      @current_depth += 1
    end
  end

  def generate_next_generation(parent)
    unless parent.children.empty?
      parent.children.each do |child|
        generate_next_generation(child)
      end
    else
      generate_children(parent)
    end
  end

  def generate_children(parent)
    get_moves(parent.x,parent.y).each do |move|
      #unless @played_moves.count([move[0], move[1]]) >= 0
        parent.children << Square.new(move[0],move[1], @current_depth, [])
        @nodes += 1
        @played_moves << [move[0], move[1]]
      #end
    end
  end

  def inspect
    puts "Nodes: #{@nodes}"
    puts "#{@root.children}"
  end

  def outbounds?(x,y)
    x >= @@BOARD_SIZE || x < 0 || y >= @@BOARD_SIZE || y < 0
  end

  def get_moves(x,y)
    moves = [[-2, -1],[-2,1],[2, 1],[2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    moves.map!{|sq| [sq[0] + x, sq[1] + y]}

    moves.reject!{|sq| outbounds?(sq[0],sq[1])}

    moves
  end

end