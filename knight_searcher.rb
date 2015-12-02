require_relative 'move_tree'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

# Ensure that squares in the same search aren't hit twice by recording and checking for the depth attribute to prevent cycles.

  # Breadth-First tree search
  def bfs_for(target_coords, render_output = true)
    # Put the root node in the queue.
    queue = [@tree.head]

    # Would be more efficient to build the move tree in such a way that nodes aren't duplicated there but since it allows for all possible moves from a given location, keeping track of visited coords here. Would a graph be a better data type?
    visited = []
    count = 0

    # Check the first node in the queue. If it matches, return it.  If not, add its children to the queue. Keep repeating until a match is found or no nodes left in queue.
    loop do
      current_node_coords = [queue[0].x, queue[0].y]
      visited << current_node_coords
      count += 1

      if current_node_coords == target_coords
        return output_results(queue[0], count, 'BFS', render_output)
      elsif queue[0].children.nil?
        queue.delete_at(0)
      else
        queue[0].children.each do |child|
          queue << child unless visited.include?([child.x, child.y])
        end
        queue.delete_at(0)
      end

      # Check if no nodes left
      if queue.empty?
        puts "Reached end of queue with no matches"
        break
      end
    end
  end

  def dfs_for(target_coords, render_output = true)
    # Put the root node on the stack.
    stack = [@tree.head]

    # In practice, did not find a case where keeping track helped.
    visited = {}
    count = 0

    # Check the top node on the stack. If it matches, return it.  If not, peek at the children and put the 'worst' child on the stack first followed by the other child. Keep repeating this step until a match is found or no nodes left in stack.
    loop do
      current_node_coords = [stack.last.x, stack.last.y]

      # Creates a hash of visited nodes based on depth
      if visited[stack.last.depth].nil?
        visited[stack.last.depth] = [current_node_coords]
      else
        visited[stack.last.depth] += current_node_coords
      end
      count += 1

      if current_node_coords == target_coords
        return output_results(stack.last, count, 'DFS', render_output)
      elsif stack.last.children.nil?
        stack.pop
      else
        last = stack.pop
        last.children.each do |child|
          # Push child onto stack unless the node has already been visited at a lower depth
          unless visited.any?{|depth, coords| depth <= child.depth && coords.include?([child.x, child.y])}
            # binding.pry
            stack << child
          end
        end
      end

      # Check if no nodes left
      if stack.empty?
        puts "Reached end of stack with no matches"
        break
      end
    end
  end

  private

  def output_results(node, count, type, render_output)
    if render_output
      puts "#{type} success!  In #{node.ancestors.size} moves with #{count} steps:"
      node.ancestors.each{ |move| puts move.to_s }
      puts "[#{node.x}, #{node.y}]"
    else
      {type: type, moves: node.ancestors.size, steps: count}
    end
  end
end

# knight_tree = MoveTree.new([2,2], 5, 8)
# knight_tree.inspect
# searcher = KnightSearcher.new(knight_tree)
# searcher.bfs_for([7,4])
# searcher.dfs_for([7,4])

# # Max depth of 10 gives 22B nodes with board size of 8, but only need a max depth of 4 for BFS for these scenarios.
# tree = MoveTree.new([0,0], 5, 8)
# tree.inspect
# KnightSearcher.new(tree).bfs_for([1,2])
# KnightSearcher.new(tree).bfs_for([6,0])

# KnightSearcher.new(tree).dfs_for([1,2])
# KnightSearcher.new(tree).dfs_for([6,0])