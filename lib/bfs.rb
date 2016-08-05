require_relative 'tree.rb'

class KnightSearcher
  def initialize tree
    @origin = tree.root
  end

  def bfs_for target_coords
    queue = []
    current = @origin
    until cood_right? current, target_coords do
      current.children.each do |child|
        queue << child
      end
      current = queue.shift
    end
    depth = current.depth
    path = path_to current
    # puts "#{depth} moves"
    # display path
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
