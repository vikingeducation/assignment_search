require 'tree_builder'


class TreeBFS

  def self.search(root, target_coords)

    queue = [root]

    until queue.empty?
      current_node = queue.shift

      if  current_node.x == target_coords[0] &&
          current_node.y == target_coords[1]
          return current_node
      else
        current_node.expand

        current_node.children.each do |child|
          queue << child
        end
      end
    end
  end

end

def knight_moves(start_coords, target_coords)
  # build first node
  starting_node = Node.new(starting_coords[0], start_coords[1], nil, nil, 0)

  # serch those children to see if any arre target
  result = TreeBFS.search(root, target_coords)

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
  puts path.reverse
end
