# Knight's Travails

# Knight - search moves until reaching target position


module KnightsTravails

  class KnightSearcher

    attr_reader :move_tree

    def initialize(move_tree)
      @move_tree = move_tree
    end

    # breadth first search 
    def bfs_for(target_coords)

      start = move_tree.start_node
      start.depth = 0
      queue = [ start ]

      until queue.empty?
        current = queue.pop

        # if target found ... return path traced
        if target_coords == [current.x, current.y]
          return trace_path_to(current)

        # else add all children not yet visited to queue
        else
          current.children.each do |move|
            next if move.depth # depth set means it has been visited
            queue.unshift(move)
            move.depth = current.depth + 1
          end
        end
      end
      "Not found!" # if queue runs out of moves (tree too small or 
                   # stopped at certain depth)

    end

    # depth first search
    def dfs_for(target_coords)
      stack = [move_tree.start_node]
      depth = 0
      current = nil

      until stack.empty?
        current = stack.pop
        current.depth = depth
        if target_coords == [current.x, current.y]
          return trace_path_to(current)
        end
        depth += 1
        current.children.each {|move| stack.push(move) unless move.depth}
      end
      "Not found!" # if stack runs out of moves (tree too small or 
                   # stopped at certain depth)
    end

    private

    # return coordinate path from start node until current move 
    # by traversing the tree
    def trace_path_to(move)
      path = []
      node =  move

      until node.nil?
        path.unshift[node.x, node.y]
        node = node.parent
      end

      path

    end


  end # class KnightSearcher

end # module KnightsTravails








