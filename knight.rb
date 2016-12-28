Move = Struct.new(:x, :y, :depth, :children, :parents)

class MoveTree
  attr_accessor :root

  ALL_MOVES = [[1,2], [-1,2], [1,-2], [-1,-2], [2, 1], [-2,1], [2,-1], [-2,-1]]

  def initialize(coord_array, max_depth)
    @coord_array = coord_array
    @max_depth = max_depth
    @root = Move.new(coord_array[0], coord_array[1], 0, nil, nil)
  end

  def add_child(current_node,x,y,depth)
    new_node = Move.new(x, y, depth, nil, current_node)
    current_node.children = new_node
  end

  def build_tree
    current_node = @root
    depth = 0
    move = 0
    while depth < @max_depth
      depth += current_node.depth + 1
      ALL_MOVES.each do |(x1,y1)|
        x = current_node.x + x1
        y = current_node.y + y1
        puts "DBG: [x,y] = #{[x,y].inspect}"
        if x < 7 && x > 0 && y < 7 && y > 0
          new_node = Move.new(x, y, depth, nil, current_node)
          puts "DBG: new_node = #{new_node.inspect}"
          move += 1
          current_node.children = new_node
        end
      end
      next_node = current_node.children
      current_node = next_node
    end
    move
  end

  def inspect
    @troot.inspect.each_char {|char| char != "#" ? (print char) : (puts char)}
    puts "Your tree has #{build_tree} Move nodes and a maximum depth of #{@max_depth}."
  end

end


tree = MoveTree.new([0,0], 10)
puts "#{tree.inspect}"