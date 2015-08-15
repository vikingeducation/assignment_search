class KnightSearcher

  def initialize(move_tree)
    @move_tree = move_tree
  end


  def bfs_for(coords)
    queue = [@move_tree.root]
    nodes_searched = 0
    result = []

    until queue.empty?

      current_node = queue.shift
      nodes_searched += 1

      if current_node.coords == coords
        result = [current_node, nodes_searched] 
        break
      end

      queue += current_node.children

    end

    result
    
  end


  def dfs_for(coords)
    stack = [@move_tree.root]
    nodes_searched = 0
    result = []

    until stack.empty?

      current_node = stack.pop
      nodes_searched += 1

      if current_node.coords == coords
        result = [current_node, nodes_searched]
        break
      end

      stack += current_node.children

    end

    result
  end


  def render_search(search_type, coords)
    result = self.send search_type, coords
    puts "Number of Moves: #{result[0].parent_coords.length}"
    print result[0].parent_coords
    result[0].coords
  end

end