require_relative 'tree_builder'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for (final_dest) #incomplete
    counter = 0
    current_node = @tree.root

    until search == final_dest
      answer = []
      counter += 1
      queue = tunneler(current_node, counter)
      queue.each do |child|
        if child.x == final_dest[0] && child.y == final_dest[1]
          answer << [child.x,child.y]
          p answer
        end
          queue.shift
          queue  << child.children
       end

    end
  end


  def tunneler(parent, level)
    queue = []
    parent.children.each do |child|
       queue << child
    end
    queue
  end

end