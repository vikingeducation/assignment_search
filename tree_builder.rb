

class Node
  MOVES = [ [-2,-1], [-2,1],
          [-1,2] , [-1,-2],
          [1,2]  , [1,-2],
          [2,1]  , [2,-1]
          ]

  RANGE = (0..7)

  def initialize(x,y, depth, parent = nil, children = nil)
    @x = x
    @y = y
    @depth = depth
    @parent = parent
    @children = children

  end

  def expand
    children = []
    parent = node
    depth = node.depth + 1

    MOVES.each do |move|
      x = @x + move[0]
      y = @y + move[1]

      if RANGE.include? x && RANGE.include? y
        @children << Node.new(x, y, @depth + 1, self, nil)
      end
    end
  end

end
