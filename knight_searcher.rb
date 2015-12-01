require_relative 'move_tree'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

# Ensure that squares in the same search aren't hit twice by recording and checking for the depth attribute to prevent cycles.

  # Breadth-First tree search
  def bfs_for(target_coords)
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
        output_results(queue[0], count)
        break
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

  private

  def output_results(node, count)
    puts "Success!  In #{node.ancestors.size} moves with #{count} steps:"
    node.ancestors.each{ |move| puts move.to_s }
    puts "[#{node.x}, #{node.y}]"
  end
end

knight_tree = MoveTree.new([2,2], 5)
knight_tree.inspect
searcher = KnightSearcher.new(knight_tree)
searcher.bfs_for([4,4])