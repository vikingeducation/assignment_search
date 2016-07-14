Node = Struct.new(:x, :y, :depth, :children)

class ChessTree
  def initialize(size)
    @root = nil
    @size = size
  end


  def insert(x, y)
    if @root.nil?
      add_root(x, y)
    else
      node = nodify(x, y)
      add_node(node)
    end
  end
  
  def nodify(x, y)
    node.new(x, y, nil, [])
  end

  def add_root(x, y)
    @root = nodify(x, y, 0, [])
  end

  def add_node(node)
    current_node = @root
    parent = nil
    until current_node.nil?
      parent = current_node
      if node.value < current_node.value
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end

    node.value < parent.value ? parent.left = node : parent.right = node
  end
end