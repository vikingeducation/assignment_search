class Node
  attr_accessor :x, :y, :depth, :parent, :children

  MOVES = [ [-2,-1], [-2,1],
          [-1,2] , [-1,-2],
          [1,2]  , [1,-2],
          [2,1]  , [2,-1]
          ]

  RANGE = (0..7)

  def initialize(x,y, depth, parent = nil, children = [])
    @x = x
    @y = y
    @parent = parent
    @children = children
    @depth = depth
  end

  def expand
    MOVES.each do |move|
      x = @x + move[0]
      y = @y + move[1]

      if RANGE.include?(x) && RANGE.include?(y)
        @children << Node.new(x, y, @depth + 1, self)
      end
    end
  end
end
