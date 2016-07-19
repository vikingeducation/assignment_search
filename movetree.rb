class Move
  attr_accessor :x, :y, :depth, :children, :parent
  def initialize(x=0, y=0, depth=0, children=[], parent=nil)
    @x = x
    @y = y
    @depth = depth
    @children = children
    @parent = parent
  end
end

class MoveTree
  attr_accessor :max, :root
  BOARD_SIZE = 8
  VECTORS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [-2, 1], [-2, -1], [2, -1]]

  def initialize(start, max_depth)
    @max = max_depth
    @root = Move.new(start[0], start[1], 0, [], nil)
  end

  def generate(node)
    return if node.depth == @max
    moves = viable_moves(node)
    moves.each do |move|
      node.children[node.children.length] = Move.new(move[0], move[1], node.depth+1, [], node)
    end
    node.children.each do |child|
      generate(child)
    end
  end

  def count_nodes(node)
    count = 0
    bfs(node) {count += 1}
    count
  end

  def viable_moves(start)
    moves = legal_moves(start)
    node = start
    until node.parent.nil?
      if moves.include?([node.parent.x, node.parent.y])
        moves.delete([node.parent.x, node.parent.y])
      end
      node = node.parent
    end
    moves
  end

  def legal_moves(node)
    moves = []
    a = node.x
    b = node.y
    VECTORS.each do |m, n|
      if (0..(BOARD_SIZE-1)).include?(a+m) && (0..(BOARD_SIZE-1)).include?(b+n)
        moves << [a+m, b+n]
      end
    end
    return moves
  end

  def bfs(node)
    queue = []
    yield(node)
    node.children.each do |child|
      queue.push(child)
      yield(child)
    end
    until queue.empty?
      queue[0].children.each do |child|
        queue.push(child)
        yield(child)
      end
      queue.shift
    end
  end

  def dfs(node)
    stack = []
    yield(node)
    node.children.reverse.each do |child|
      stack.push(child)
    end
    until stack.empty?
      recent = stack.pop
      yield(recent)
      recent.children.reverse.each do |child|
        stack.push(child)
      end
    end
  end

end
