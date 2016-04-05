require_relative "move_tree"
require "benchmark"

class KnightSearcher
  attr_accessor :count, :moves

  def initialize(knight_tree)
    @tree = knight_tree
  end

  def bfs_for(target_coords)
    queue = [@tree.root]
    while current_node = queue.shift
      if [current_node.x, current_node.y] == target_coords
        return #path(current_node)
      end
      current_node.children.each { |child| queue << child }
    end
    puts "Sorry, we could not make it"
  end

  def dfs_for(target_coords)
    stack = [@tree.root]
    while current_node = stack.pop
      if [current_node.x, current_node.y] == target_coords
        return #path(current_node)
      end
      current_node.children.each { |child| stack << child }
    end
    puts "Sorry, we could not make it"
  end

  def path(current_node)
    puts "#{current_node.depth} Moves :"
    puts "[#{current_node.x}, #{current_node.y}]"

    while current_node = current_node.parent
      puts "[#{current_node.x}, #{current_node.y}]"
    end
  end

end
tree = MoveTree.new([1,1], 8)
knight = KnightSearcher.new(tree)
#knight.bfs_for([1,3])
#knight.bfs_for([6,1])
#knight.dfs_for([6,1])
iterations = 10_000

Benchmark.bm do |bm|
  bm.report("bfs [6,1]") do 
    iterations.times do
      knight.bfs_for([6,1])
    end
  end
  bm.report("dfs [6,1]") do 
    iterations.times do 
      knight.dfs_for([6,1])
    end
  end

  bm.report("bfs [1,3]") do 
    iterations.times do
      knight.bfs_for([1,3])
    end
  end
  bm.report("dfs [1,3]") do 
    iterations.times do 
      knight.dfs_for([1,3])
    end
  end
end


