require 'tree_builder'


class TreeBFS

  def root
    #
  end

  def search(starting, target)
    root = Node.new(starting[0], starting[1], nil, nil, 0)
    tree = TreeBuilder.new(root)

    queue = [tree]

    until queue.empty?
      current_node = queue.shift 
      if current_node.left != nil
        queue << current_node.left 
      end
      if current_node.right != nil
        queue << current_node.right 
      end
      puts current_node.value 
    end
  end

end


def knight_moves(starting, target)
  #
end