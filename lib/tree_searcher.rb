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


