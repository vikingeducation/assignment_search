require_relative 'move_tree'
require_relative 'move'

class KnightSearcher
  def initialize(tree)
    @root = tree.root
  end

  def bfs_for(coord)
    target = bfs_find_target(coord)
    moves = get_moves(target)
    print_moves(moves)
  end

  def dfs_for(coord)
    target = dfs_find_target(coord)
    moves = get_moves(target)
    print_moves(moves)
  end

  def print_moves(moves)
    puts "#{moves.size} Move(s)" unless moves.empty?
    moves.each { |move| print "#{move}\n" }
  end

  def get_moves(target)
    moves = []
    while target
      moves.unshift([target.x, target.y])
      target = target.parent
    end
    moves
  end

  def dfs_find_target(coord)
    x = coord[0]
    y = coord[1]
    stack = [@root]
    target = ''
    until stack.empty?
      current = stack.pop
      if x == current.x && y == current.y
        return current
      end
      current.children.each { |child| stack << child }
    end
    puts "Move not found"
  end

  def bfs_find_target(coord)
    x = coord[0]
    y = coord[1]
    queue = [@root]
    target = ''
    until queue.empty?
      current = queue.shift
      if x == current.x && y == current.y
        return current
      end
      current.children.each { |child| queue << child }
    end
    puts "Move not found"
  end


end

s = KnightSearcher.new( MoveTree.new([0, 0], 20))
s.bfs_for([6, 0])
s.dfs_for([6, 0])
