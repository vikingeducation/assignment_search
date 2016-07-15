class KnightSearcher
  def initialize(tree)
    @tree = tree
  end


  def bfs_for(target)
    queue = []
    queue << @tree.root
    unless queue[0].x == target.x && queue[0].y == target.y
      if queue[0].children == []
        queue.shift
      end
      queue[0].children.each do |child|
        queue.push(child)
      end
    queue.shift
  end

end



searcher = KnightSearcher.new(ChessTree.new(5,10))
