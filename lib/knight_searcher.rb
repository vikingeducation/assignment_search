require_relative 'knight'

class KnightSearcher

  def initialize(moves_tree)
    @start = moves_tree.starting_pos
    @max_depth = moves_tree.max_depth
  end

  def bfs_for(target_coords)
    queue = [@start]
    while node = queue.pop
      if match?(node, target_coords)
        puts "Found after #{node.depth} moves."
        puts "Move sequence (backwards from target):"
        print_moves_history(node)
        return node 
      else
        node.children.each do |child|
          queue.unshift(child)
        end
      end 
    end
  end

  def print_moves_history(node)
    while node
      puts "[#{node.x}, #{node.y}]"
      node = node.parent
    end
  end

  def match?(current, target_coords) 
    return true if current.x == target_coords[0] && current.y == target_coords[1]
    false
  end

end