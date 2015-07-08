require_relative './move_tree.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(move)
    queue = []
    parent = {}
    queue << @tree.root
    move_order = []

    while queue.any?
      current = queue.shift
      return path(parent,@tree.root, current) if move_found(current, move)
      current.children.each do |child|
        parent[child] = current
        queue << child
      end
    end
  end

  def path(parent, start, endpoint)
    result = [endpoint]
    until result[-1] == start
      result << parent[result[-1]]
    end
    result = result.reverse
    p result.map{|str| [str.x, str.y]}
  end

  def move_found(child, move)
    child.x == move[0] && child.y == move[1]
  end

end

t = MoveTree.new([4,4],5)
k = KnightSearcher.new(t)

puts k.bfs_for([0,0])

