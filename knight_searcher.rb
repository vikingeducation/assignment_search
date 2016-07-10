require_relative 'move_tree.rb'

# Searching the same tree using BFS.

# 1. Put the initial node into our queue and start checking every node in the queue.
# 2. For the first node of the queue, return if it matches our search criteria. If not, add each of its children to the end of the queue.
# 3. Continue dequeuing nodes and checking them until the target is located or the queue empties (failure).


class KnightSearcher
  attr_reader :tree
  def initialize(tree)
    @tree = tree
    @queue = []
    @stack = []
    @result = []
  end

  def bfs_for(target_coords)
    node = bfs(target_coords)
    until node.nil?
      @result.unshift(node)
      node = node.parent
    end
    if !@result.empty?
      puts "BFS in #{@result.size-1} Moves:"
      @result.each { |node| puts "[#{node.x}, #{node.y}]"}
    else
      puts "BFS did not find the target_coords #{target_coords}"
    end
  end

  def bfs(target_coords)
    root = @tree.root
    @queue << root
    until @queue.empty?
      node = @queue.shift
      return node if node.x == target_coords.first && node.y == target_coords.last
      node.children.each do |child|
        next if child.nil?
        @queue << child
      end
    end
    nil
  end

  def dfs_for(target_coords)
    node = dfs(target_coords)
    until node.nil?
      @result.unshift(node)
      node = node.parent
    end
    if !@result.empty?
      puts "DFS in #{@result.size-1} Moves:"
      @result.each { |node| puts "[#{node.x}, #{node.y}]"}
    else
      puts "DFS did not find the target_coords #{target_coords}"
    end
  end
end

def dfs(target_coords)
  root = @tree.root
  @stack << root
  until @stack.empty?
    node = @stack.pop
    return node if node.x == target_coords.first && node.y == target_coords.last
    node.children.each do |child|
      next if child.nil?
      @stack << child
    end
  end
  nil
end

knight_tree = MoveTree.new([3, 3], 4)
searcher = KnightSearcher.new(knight_tree)
searcher.bfs_for([1,3])
searcher.dfs_for([1,3])
KnightSearcher.new(MoveTree.new([0,0], 6)).dfs_for([6,0])
KnightSearcher.new(MoveTree.new([0,0], 6)).bfs_for([6,0])

