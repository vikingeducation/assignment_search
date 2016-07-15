#knight_searcher.rb

class KnightSearcher
  def initialize(root)
    @root = root
  end
# input target coordinates and outputs sequence of moves and final depth
  def bfs_for(x, y)
    queue = [@root]
    current = []
    while current = queue.shift
      print "#{[current.x, current.y]} "
      if ([current.x, current.y] == [x, y])
        depth = current.depth
        break
      end
      current.children.each { |child| queue << child }
    end
    puts "\nthe final depth for a BFS: #{depth}"
  end

  def dfs_for(x, y)
    stack = [@root]
    current = []
    while current = stack.pop
      print "#{[current.x, current.y]} "
      if ([current.x, current.y] == [x, y])
        depth = current.depth
        break
      end
      current.children.each { |child| stack << child }
    end
    puts "\nthe final depth for a DFS: #{depth}"
  end
end
