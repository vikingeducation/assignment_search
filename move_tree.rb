Move = Struct.new(:x,:y,:depth,:children,:parent)

class MoveTree
  attr_accessor :tree, :root

  MOVEMENT_DIFF = [
                    [+2, +1],
                    [+2, -1],
                    [-2, +1],
                    [-2, -1],
                    [+1, +2],
                    [-1, +2],
                    [+1, -2],
                    [-1, -2]
                  ]

  def initialize(coordinate, depth)
    @root = Move.new(coordinate[0],coordinate[1],0,[],nil)
    @node_count = 1
    @max_depth = depth
    make_tree
  end

  def make_tree
    (1..@max_depth).each do |depth_layer|
      #find parents
      find_childless
      # make children for each parent node
      make_children(depth_layer)
    end
    @node_count
  end

  #should generate queue (array of all childless parent nodes)
  def find_childless
    @childless = []
    queue = [@root]
    until queue.empty?
      curr_node = queue[0]
      if curr_node.children.empty?
        @childless << curr_node
      else      
        queue += curr_node.children
      end
      queue.shift
    end
    @childless
  end

  #should generate children nodes 
  def make_children(depth_layer)
    @childless.each do |node|
      coords = generate_children_coordinates(node.x, node.y)
      coords.each do |x,y|
        child = Move.new(x,y,depth_layer,[],node)
        node.children ||= []
        node.children << child
        @node_count += 1
      end
    end
      #generate coordinates for children
      #creates child nodes with child coordinates, appropriate depth attribute, appropriate parent node attribute)
  end

  #should generate coordinates for each child node
  def generate_children_coordinates(x,y)
    child_coordinates = []
    MOVEMENT_DIFF.each do |dx, dy|
      move = [x+dx, y+dy]
      child_coordinates << move if within_limits?(move)
    end
    child_coordinates
  end

  def within_limits?(move)
    move.each { |var| return false unless var <= 7 && var >= 0 } 
    true
  end

  def move_tree_inspect
    puts "Your tree has #{@node_count} Move nodes and a maximum depth of #{@max_depth}."
  end
end



=begin



load 'move_tree.rb'
a = MoveTree.new([3,3], 10)




=end