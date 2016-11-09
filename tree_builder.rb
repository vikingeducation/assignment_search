Node = Struct.new(:x, :y, :parent, :children, :depth)

class TreeBuilder
  MOVES = [ [-2,-1], [-2,1],
          [-1,2] , [-1,-2],
          [1,2]  , [1,-2],
          [2,1]  , [2,-1] 
          ]

  def initialize node
    build(node)
  end

  def build(node)
    children = []
    parent = node
    depth = node.depth + 1

    MOVES.each do |move|
      x = node.x + move[0]
      y = node.y + move[1]

      children << Node.new(x, y, parent, nil, depth)
    end
    node.children = children
    node
  end

end