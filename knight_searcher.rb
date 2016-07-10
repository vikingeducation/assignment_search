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
    root = @tree.root
    @queue << root
    until @queue.empty?
      node = @queue.shift
      break if node.x == target_coords.first && node.y == target_coords.last
      node.children.each do |child|
        next if child.nil?
        @queue << child
      end
    end

    until node.nil?
      @result.unshift(node)
      node = node.parent
    end
    puts "#{@result.size-1} Moves:"
    @result.each { |node| puts "[#{node.x}, #{node.y}]"}
  end
  # def bfs_for(target_coords)
  #   root = @tree.root
  #   height = @tree.height
  #   (0..height).each do |i|
  #     search_given_level(root, i, target_coords)
  #   end
  # end

  # def search_given_level(root, level, target_coords)
  #   return if root.nil?
  #   if level == 0
  #     puts "#{root.x}, #{root.y}"
  #   elsif level > 0
  #     root.children.each do |child|
  #       search_given_level(child, level-1, target_coords);
  #     end
  #   end
  # end

  def dfs_for(target_coords)

  end

end

knight_tree = MoveTree.new([3, 3], 4)
searcher = KnightSearcher.new(knight_tree)
searcher.bfs_for([1,3])