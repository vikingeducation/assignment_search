class KnightSearcher

  def initialize(tree)
    @tree = tree
    @queue = []
  end

  def bfs_for(target_coords)
    @queue << @tree.root
    current_node = @queue.shift

    until([current_node.x, current_node.y]) == target_coords || current_node.nil?
    # kicks off breadth first search of nodes in tree
    # outputs sequence of moves used and final depth required
  end
end