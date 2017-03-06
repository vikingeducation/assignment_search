class KnightSearcher
  attr_accessor :tree, :path, :moves

  def initialize(tree)
    @tree = tree
    @moves = nil
    @path = nil
  end

  # bfs
  # takes a target_coords input
  # Upon locating the target square, the method should output the
  # sequence of moves used to get there as well as the final depth required.
  # searcher.bfs_for([1,3])
  def bfs_for(target_coords, queue = nil)
    if queue.nil?
      @moves, @path = 0, []
      bfs_for(target_coords, [tree])
    elsif queue.empty?
      nil
    else
      x, y = target_coords
      node = queue.shift
      if node.x == x && node.y == y
        puts "#{moves} move#{moves == 1 ? '' : 's'}:"
        path.each{ |item| puts item.to_s}
        {moves: moves, path: path}
      else
        @moves += 1
        path.push([node.x, node.y])
        node.children.each{ |c| queue.push(c) } if node.children
        bfs_for(target_coords, queue)
      end
    end
  end

end
