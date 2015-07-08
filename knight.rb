require_relative './move_tree.rb'
require 'benchmark'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(move)
    queue = []
    parent = {}
    queue << @tree.root

    while queue.any?
      current = queue.shift
      if move_found(current, move)
        result = path(parent,@tree.root, current)
        break
      end
      current.children.each do |child|
        parent[child] = current
        queue << child
      end
    end

    result ? print_sequence(result) : "Error, no move sequence found."
  end

  def dfs_for(move)
    queue = []
    parent = {}
    queue << @tree.root

    while queue.any?
      current = queue.pop
      if move_found(current, move)
        result = path(parent,@tree.root, current)
        break
      end
      current.children.each do |child|
        parent[child] = current
        queue << child
      end
    end

    result ? print_sequence(result) : raise("Didn't find solution.")
  end

  def print_sequence(result)
    p "#{result.length - 1} moves to destination."
    result.each do |move|
      p move
    end
    return result.length
  end

  def path(parent, start, endpoint)
    result = [endpoint]
    until result[-1] == start
      result << parent[result[-1]]
    end
    result = result.reverse
    result.map{|str| [str.x, str.y]}
  end

  def move_found(child, move)
    child.x == move[0] && child.y == move[1]
  end

end

t = MoveTree.new([0,0],8)
k = KnightSearcher.new(t)

puts "BFS"
dfs_avg = 0
bfs_avg = 0
bfs_time = Benchmark.measure {
  result = 0
  (0..7).each do |x|
    (0..7).each do |y|
      result += k.bfs_for([x,y])
    end
  end
  bfs_avg = result / 64.0
}
puts "\nDFS"
dfs_time = Benchmark.measure {
  result = 0
  (0..7).each do |x|
    (0..7).each do |y|
      result += k.dfs_for([x,y])
    end
  end
  dfs_avg = result / 64.0
}

puts "Average BFS time"
puts bfs_time
puts "Average steps (BFS): #{bfs_avg}"

puts "Average DFS time"
puts dfs_time
puts "Average steps (DFS): #{dfs_avg}"
