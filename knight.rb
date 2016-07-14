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

    @starting_move = Move(position[0], position[1], 0, [], nil)
    @max_depth = max_depth
  end

  def valid_move?(x, y)
    (1..8).include?(x) && (1..8).include?(y)
  end


  def move_tree(max_depth)                                     
    depth = 0
    current = starting_move
    queue = Queue.new
    while depth < max_depth
      POSSIBLE_MOVE.each do |move|
        new_move = Move.new(move,depth+1...)
        current.children << new_move
        current.visit
        queue.enqueue(new_move)
      end
      depth += 1 if queue.first.depth > depth
      current = queue.dequeue
    end
    # counter = 0
    # while counter < max_depth
    # @possible_move.each do |move|
    #   (starting_position + starting_move).valid?
    #   starting_move.children << Move.new(new_x, new_y, 1, nil, starting_position)
    # end
    # counter += 1
  end

end


           root
 1      c c c c c c
 2  c  c c c c cc c c c cc c cc 
 3  ....
 4