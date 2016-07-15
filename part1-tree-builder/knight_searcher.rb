Class KnightSearcher

  def initialize(tree)
    @tree = tree
  end

  def bfs_for(target_coords)
    queue = []
    queue << [tree.root.x,tree.root.y]
    if queue.first == target_coords
      return path
    else
      tree.root.children.each |child|
       queue << child
      end
      queue.shift
    end

    queue.each do |child|
      if 


  end

end
