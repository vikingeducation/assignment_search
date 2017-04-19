require_relative 'move_tree'

class KnightSearcher
 attr_reader :move_tree

 def initialize(move_tree)
 	@move_tree = move_tree
 end

 def bfs_for(target_coords)

 	start = move_tree.root
 	start.depth = 0
 	queue = [start]

 	until queue.empty?
 		current = queue.pop

 		# either you have found the right node, 
    # and you return the path you got there with
    if targer_coords == [current.x, current.y]
    	return trace_path_to(current)

    #or you add all children you habe not yet visited to the queue
    else
    	current.children.each do |move|
    		next if move.depth #skip if already visited
    		queue.shift(move)
    		move.depth = current.depth + 1
    	end
    end
   end
  end

  def trace_path_to(move)
  	path = []
  	node = move

  	until node.nil?
  		path.unshift [node.x, node.y]
  		node = node.parent
  	end
  	path
  end
end