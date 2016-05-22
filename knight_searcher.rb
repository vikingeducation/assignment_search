class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(coordinates)
    queue = [@tree.root]
    while current_node = queue.shift
      if [current_node.x, current_node.y] == coordinates
        return #path(current_node)
      end
      current_node.children.each do |child|
        queue << child
      end
    end
    puts "No results found!"
  end

  def dfs_for(coordinates)
    stack = [@tree.root]
    while current_node = stack.pop
      if [current_node.x, current_node.y] == coordinates
        return #path(current_node)
      end
      current_node.children.each do |child|
        stack << child
      end
    end
    puts "No results found!"
  end

  def path(current_node)
    puts "#{current_node.depth} Moves: "
    puts "[#{current_node.x}, #{current_node.y}]"

    while current_node = current_node.parent
      puts "[#{current_node.x}, #{current_node.y}]"
    end
  end

end
