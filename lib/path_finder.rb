class PathFinder
  def find(start_coords, target_coords)
    # build first node
    starting_node = Node.new(start_coords[0], start_coords[1], 0)

    # serch those children to see if any are target
    result = TreeBFS.search(starting_node, target_coords)

    print_path(result)
  end

  def print_path(end_node)
    path = []
    parent_node = end_node

    while parent_node
      path << [parent_node.x, parent_node.y]
      parent_node = parent_node.parent
    end

    puts "It took #{end_node.depth} steps!"
    path.reverse.each do |step|
      p step 
      puts
    end
  end
end