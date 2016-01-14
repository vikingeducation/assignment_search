# Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
(assuming we are in tree class or have access to tree as in instance var or something)

def dfs_search(stack, item)
  return item if stack.pop.value == item
  return if stack is empty
  if children.exist?
    check children vs item
      put worst child in stack
      put best child in stack
      df_search(updated_stack, item)
    end
  else
    dfs_search(stack, item)
  end
end

# Searching the same tree using BFS.

def bfs_search(queue, item)
  root = @tree.root
  queue.add(root)
  current_node = queue.pop
  until current_node == item || current_node.nil?
    queue.add(current_node.left_child)
    queue.add(current_node.add_child)
    current_node = queue.pop
  end
  return current_node
end


# Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

  def dfs_adj_list(stack, item)
    @checked_edges = []
    @current_node = start
    return stack.pop if stack.pop == item
    return if @checked_edges.include?(all edges connected to stack.pop)
    if non_checked_edges.exist?
      put each node an unchecked edge connects to on the stack, worst to best
      as you pop each new node from the stack, add that edge to checked_edges
      @current_node = stack.pop
      dfs_adj_list(stack, item)
    end
  end

# Searching the same graph using BFS.

  def bfs_adj_list(queue, item)
    @checked_edges = []
    @current_node = start
    queue.add(@current_node)
    until current_node == item || current_node.nil?
      @current_node.linked_list.each do |next_node|
        queue.add(next_node)
      end
      current_node = queue.pop
    end
    return @current_node
  end
