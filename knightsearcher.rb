require './movetree.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords)
    node_queue = []
    node_queue << @tree.start_pos

    while !node_queue.empty?
      current_node = node_queue.shift
      puts "#{current_node.x}, #{current_node.y}"
      return "#{target_coords} found at depth #{current_node.depth}!" if [current_node.x, current_node.y] == target_coords
      current_node.children.each do |child|
        node_queue << child
      end
    end
  end

  def dfs_for(target_coords)
    node_stack = []
    node_stack << @tree.start_pos

    while !node_stack.empty?
      current_node = node_stack.pop
      puts "#{current_node.x}, #{current_node.y}"
      return "#{target_coords} found at depth #{current_node.depth}!" if [current_node.x, current_node.y] == target_coords
      current_node.children.each do |child|
        node_stack << child
      end
    end
  end
end

tree = MoveTree.new([3,3], 2)
tree.inspect

searcher = KnightSearcher.new(tree)
puts "#{searcher.bfs_for([2,1])}"
puts "#{searcher.dfs_for([2,1])}"