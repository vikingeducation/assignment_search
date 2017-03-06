class KnightSearcher
  attr_accessor :tree, :dfs, :bfs

  def initialize(tree)
    @tree = tree
    @dfs = {moves: 0, path: []}
    @bfs = {moves: 0, path: []}
  end

  # ---------------------------------------------------------------
  # Depth First Search
  # ---------------------------------------------------------------

  def dfs_for_(tr, target_coords)
    if tr.nil?
      @dfs = {moves: 0, path: []}
      return nil
    end
    x, y = target_coords
    if tr.is_a? Array
      first, rest = tr[0], tr[1..-1]
      dfs_for_(first, target_coords) ||
      dfs_for_(rest, target_coords)
    elsif tr.x == x && tr.y == y
      moves, path = dfs[:moves], dfs[:path]
      puts "#{moves} move#{moves == 1 ? '' : 's'}:"
      path.each{ |item| puts item.to_s}
      {moves: moves, path: path}
    else
      @dfs[:moves] += 1
      @dfs[:path].push([tr.x, tr.y])
      dfs_for_(tr.children, target_coords)
    end
  end

  def dfs_for(target_coords)
    @dfs = {moves: 0, path: []}
    dfs_for_(tree, target_coords)
  end

  # ---------------------------------------------------------------
  # Breadth First Search
  # ---------------------------------------------------------------

  def bfs_for_(target_coords, queue = nil)
    if queue.nil?
      bfs_for_(target_coords, [tree])
    elsif queue.empty?
      nil
    else
      x, y = target_coords
      node = queue.shift
      if node.x == x && node.y == y
        moves, path = bfs[:moves], bfs[:path]
        puts "#{moves} move#{moves == 1 ? '' : 's'}:"
        path.each{ |item| puts item.to_s}
        {moves: moves, path: path}
      else
        @bfs[:moves] += 1
        @bfs[:path].push([node.x, node.y])
        node.children.each{ |c| queue.push(c) } if node.children
        bfs_for_(target_coords, queue)
      end
    end
  end

  def bfs_for(target_coords)
    @bfs = {moves: 0, path: []}
    bfs_for_(target_coords, [tree])
  end

end
