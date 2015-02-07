class KnightSearcher
  def initialize (tree)
    @tree = tree
  end

  def bfs_for (target_coords)
    # Perform a breadth-first search
    # Ensure squares aren't hit twice by checking depth attribute
    # After locating the target square, output the sequence of moves
  end

  def dfs_for (target_coords)
    # Perform a depth-first search
    # Ensure squares aren't hit twice by checking depth attribute
    # After locating the target square, output the sequence of moves
  end

  def scout_node(node, target_coords)
    # Receives a node
    # Checks every one of the child node
    # returns the child nodes if it matches the target coordinates
    # else it quits
  end
end