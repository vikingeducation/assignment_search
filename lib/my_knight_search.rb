Coord = Struct.new(:x, :y)
Node = Struct.new(:coord, :parent, :children)

class KnightSearcher

  def initialize
    @queue = []
    @current_node = nil
    @seen_coords = []
  end

  def find_best_path(start, dest)
    start_node = Node.new(start, nil, [])
    @queue << start_node
    winner = bfs_search(dest)
    print_parent_path(winner)
  end

  def bfs_search(dest)
    return "empty queue" if @queue.empty?
    @current_node = @queue.pop
    @seen_coords << @current_node.coord
    return @current_node if @current_node.coord == dest
    add_children(@current_node)
    add_children_to_queue(@current_node)
    bfs_search(dest)
  end

  def add_children_to_queue(node)
    node.children.each do |c|
      @queue.unshift(c) unless @seen_coords.include?(c.coord)
    end
  end

  def create_parent_path(node)
    ancestors = []
    until node.nil?
      ancestors << node
      node = node.parent
    end
    ancestors.reverse!.map! do |n|
      n.nil? ? '*' : [n.coord.x, n.coord.y]
    end
  end

  def add_children(node)
    children = generate_children(node)
    node.children = children
  end

  def generate_children(node)
    coord = node.coord
    gen_transformations(coord).map do |c|
      Node.new(c, node, [])
    end
  end

  def gen_transformations(coord)
    tcs = transformations_coords.map do |tc|
      Coord.new((coord.x + tc.x), (coord.y + tc.y))
    end
    tcs.select { |c| good_coord?(c) }
  end

  def good_coord?(coord)
    (0..7).include?(coord.x) && (0..7).include?(coord.y)
  end

  def transformations_coords
    transformations.map do |t|
      Coord.new(t[0], t[1])
    end
  end

  def transformations
    [
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2],
      [-2, -1],
      [-2, 1],
      [-1, 2],
    ]
  end

  def display_node_children(node)
    puts "nuttin" if node.nil?
    node.children.each do |child| 
      display_node(child)
    end
    puts "------"
  end

  def test_display
    display_node(@current_node)
    puts "*****"
    display_node_children(@current_node)
  end

  def display_node(node)
    p [node.coord.x, node.coord.y]
  end

  def print_parent_path(node)
    ancestors = create_parent_path(node)
    ancestors.each do |a|
      p a
    end
  end

end
