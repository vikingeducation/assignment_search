Move = Struct.new(:x, :y, :depth, :children, :parent)



class MoveTree

  POSSIBLE_MOVE =[[-2, 1],
                 [-1, 2],
                 [ 1, 2],
                 [ 2, 1],
                 [-2,-1],
                 [-1,-2],
                 [ 1,-2],
                 [ 2,-1]]

  def initialize(position, max_depth)

    @starting_move = Move.new(position[0], position[1], 0, [], nil)
    @max_depth = max_depth
  end

  def valid_move?(x, y)
    (1..8).include?(x) && (1..8).include?(y)
  end


  def move_tree                                   
    depth = 0
    current = @starting_move
    queue = []
    while depth < @max_depth
      POSSIBLE_MOVE.each do |move|
        if valid_move?(current.x + move[0], current.y + move[1])
          new_move = Move.new(current.x + move[0], current.y + move[1], depth+1, [], current)
          current.children << new_move
          queue.unshift(new_move)
        end
      end
      depth += 1 if queue.last.depth > depth
      current = queue.pop
    end
  end
    # counter = 0
    # while counter < max_depth
    # @possible_move.each do |move|
    #   (starting_position + starting_move).valid?
    #   starting_move.children << Move.new(new_x, new_y, 1, nil, starting_position)
    # end
    # counter += 1

end

k = MoveTree.new([2,2], 3)
k.move_tree
 #           root
 # 1      c c c c c c
 # 2  c  c c c c cc c c c cc c cc 
 # 3  ....
 # 4