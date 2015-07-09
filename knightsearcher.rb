require_relative 'tree_builder'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for (goal) #incomplete
    origin = @tree.root
    queue = []
    current_node = [origin.x, origin.y]
    until [current_node.x, current_node.y] == goal
      current_node.children.each do |child|
        queue += queue_children(child)
      end
      current_node = queue.shift
    end
  end


  def queue_children(parent)
    append_queue = []
    parent.children.each do |child|
       append_queue << child
    end
    append_queue
  end

end