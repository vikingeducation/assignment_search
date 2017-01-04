require_relative "knight_tree"


class KnightSearcher

  def initialize(tree)
    @stack = []
    @queue = []
    @tree = tree.root
  end

  def bfs_for(target_coords)
    tx = target_coords[0]
    ty = target_coords[1]
    enqueue(@tree)
    while @queue.any?
      current_node = dequeue
      if current_node.x == tx && current_node.y == ty
        solution_array = array_moves_from_current_node_to_root(current_node)
        print_moves_sequence(solution_array)
        break
      else
        current_node.children.each {|child| enqueue(child)} if current_node.children != nil
      end
    end
  end

      #recursive part 2
  def dfs_for(target_coords, current_node = @tree)
    tx = target_coords[0]
    ty = target_coords[1]
    current_node.children.each do |child|
      if child.x == tx && child.y == ty
        solution_array = array_moves_from_current_node_to_root(child)
        print_moves_sequence(solution_array)
        return -1
      else
        result = dfs_for(target_coords, child)
        return -1 if result == -1
      end
    end
  end

  private

  def enqueue(node)
    @queue << node
  end

  def dequeue
    @queue.shift
  end

  def add_to_stack(node)
    @stack << node
  end

  def remove_from_stack
    @stack.pop
  end

  def print_moves_sequence(array)
    puts "There are #{array.length} moves to reach the target"
    array.each {|coords| puts "#{coords}"}
  end

  def array_moves_from_current_node_to_root(current_node)
    solution_array = []
    while current_node
      current_coords = [current_node.x, current_node.y]
      solution_array.unshift(current_coords)
      current_node = current_node.parents
    end
    solution_array
  end

# #  iterative solution
#   def dfs_for(target_coords)
#     tx = target_coords[0]
#     ty = target_coords[1]
#     add_to_stack(@tree)
#     while @stack.any?
#       current_node = remove_from_stack
#       if current_node.x == tx && current_node.y == ty
#         solution_array = array_moves_from_current_node_to_root(current_node)
#         print_moves_sequence(solution_array)
#         break
#       else
#         current_node.children.each {|child| add_to_stack(child)} if current_node.children != nil
#       end
#     end
#   end




end

knight_tree = MoveTree.new([3,3], 5)
searcher = KnightSearcher.new( knight_tree )
searcher.bfs_for([1,6])
searcher.dfs_for([1,6])