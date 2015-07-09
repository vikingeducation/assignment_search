Square = Struct.new(:x, :y, :depth, :parent, :children)

class MoveTree

  attr_reader :start

  def initialize(coords, max_depth)

    x,y = coords

    @start = Square.new(x,y,0)

    queue = []

    current_square = @start
   
    until current_square.depth == max_depth
      current_square.children = find_children(current_square)
      queue += current_square.children
      current_square = queue.shift
    end
  end


  def find_children(parent)

    children = []

    moves.each do |move|
      children << Square.new(parent.x + move[0],
                             parent.y + move[1],
                             parent.depth + 1,
                             parent)
    end

    children.select { |square| legal?(square) }
  end


  def legal?(square)    
    on_board?(square) && is_not_grandparent?(square)
  end

  def on_board?(square)
    (0..7).include?(square.x) && (0..7).include?(square.y) 
  end


  def is_not_grandparent?(square)

    square.parent.parent.nil? ||
    (square.x != square.parent.parent.x && square.y != square.parent.parent.y) 

  end


  def moves
    [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,-1],[-2,1]]
  end
end






