class KnightSearcher
  include KnightsTravails
  attr_reader :move_tree
  def initialize(move_tree)
    @move_tree = move_tree
  end

  def bfs_for(target)
    start = move_tree.start_node
    start.depth = 0
    queue = [start]
    until queue.empty?
      current = queue.pop
      if target == [current.x, current.y]
        return path_to(current)
      else
        current.children.each do |move|
          next if move.depth
          queue.unshift(move)
          move.depth = current.depth + 1
        end
      end
    end
    puts "Could not find node."
  end

  def dfs_for(target)
    stack = [move_tree.start_node]
    depth = 0
    current = nil
    until stack.empty?
      current = stack.pop
      current.depth = depth
      return path_to(current) if target == [current.x, current.y]
      depth += 1
      current.children.each {|s| stack.push(s) unless s.depth}
    end
    puts "Could not find node."
  end

  def path_to(move)
    path = []
    node = move
    until node.nil?
      path.unshift[node.x, node.y]
      node = node.parent
    end
      puts path
  end
end
