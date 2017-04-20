Move = Struct.new(:x, :y, :depth, :children, :parent)

class MoveTree
  def initialize(coord, max_depth)
    @x = coord[0]
    @y = coord[1]
    @depth = 0
    @max_depth = max_depth
    @node_count = 0
    @root = Move.new(@x, @y, 0, [], nil)
    add_next_moves(@root)
    build_tree(@root, 0)
  end

  def root
    @root
  end

  def inspect(show_tree = true)
    print_move(@root) if show_tree
    puts "The tree has #{@node_count} nodes in it at a depth of #{@depth}"
  end

  private

  def print_move(node, indent = 0)
    indent += 3
    print '|--'.rjust(indent)
    puts "X:#{node.x} Y:#{node.y} Depth:#{node.depth}"
    return if node.children.nil?
    node.children.each do |n|
      print_move(n, indent)
    end
  end

  def build_tree(node, curr_depth)
    curr_depth += 1
    return if curr_depth == @max_depth
    node.children.each do |n|
      add_next_moves(n)
      build_tree(n, curr_depth)
    end
  end

  def add_next_moves(node)
    curr_depth = node.depth + 1
    valid_moves = [[1,2], [-1,2], [1,-2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]
    valid_moves.each do |move|
      new_x = node.x + move[0]
      new_y = node.y + move[1]
      if valid_location?(new_x, new_y)
        node.children << Move.new(new_x, new_y, curr_depth, [], node)
        @node_count += 1
      end
    end
    @depth = [@depth, curr_depth].max
  end

  def valid_location?(x, y)
    (0..7).cover?(x) && (0..7).cover?(y)
  end
end

# test code
if __FILE__ == $PROGRAM_NAME
  knight = MoveTree.new([4, 4], 3)
  knight.inspect
end
