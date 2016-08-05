require_relative 'tree.rb'

class KnightSearcher
  def initialize tree
    @origin = tree.root
  end

  def dfs_for target_coords
    stack = []
    current = @origin
    until cood_right? current, target_coords do
      current.children.each do |child|
        stack << child
      end
      current = stack.pop
    end
    depth = current.depth
    path = path_to current
  end

  def path_to node
    path = []
    path << node
    while node.depth != 0
      path << node.parent
      node = node.parent
    end
    path.reverse
  end

  def display path, depth
    puts "#{depth} moves"
    path.each do |p|
      puts "[#{p.x},#{p.y}]"
    end
  end

  def cood_right? current_node, target_cood
    true if current_node.x == target_cood[0] && current_node.y == target_cood[1]
  end


end
