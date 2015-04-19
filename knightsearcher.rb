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
      if [current_node.x, current_node.y] == target_coords
        puts "Path taken:"
        return node_trace(current_node)
      end
      current_node.children.each do |child|
        node_queue << child
      end
    end
  end

  def node_trace(node)
    while !node.nil?
      puts "#{node.x}, #{node.y}"
      node = node.parent
    end
  end

  def dfs_for(target_coords)
    node_stack = []
    node_stack << @tree.start_pos

    while !node_stack.empty?
      current_node = node_stack.pop
      if [current_node.x, current_node.y] == target_coords
        puts "Path taken:"
        return node_trace(current_node)
      end
      current_node.children.each do |child|
        node_stack << child
      end
    end
  end
end
