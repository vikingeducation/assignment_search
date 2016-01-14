require_relative 'move'

class MoveTree
  attr_reader :root

  def initialize(starting_location,max_depth)
    x = starting_location[0]
    y = starting_location[1]
    @root = Move.new(x,y,0,nil,nil)
    @max_depth = max_depth
    @nodes = 1
    add_move(@root)
  end

  def inspect
    puts "Your tree has #{@nodes} nodes and a maximum depth of #{@max_depth}."
  end

  #Adding the array of children "moves"
  def add_move(current_node)
    x = current_node.x
    y = current_node.y
    possible_moves = [[x+2,y+1],[x+2,y-1],[x-2,y+1],[x-2,y-1],[x+1,y+2],[x+1,y-2],[x-1,y+2],[x-1,y-2]]

    #Take out moves that are out of bounds from possible_moves
    possible_moves.reject! do |move|
      move[0] < 0 || move[0] > 7 || move[1] < 0 || move[1] > 7
    end

    #Produce a possible_moves array with each element being a Move.new + a child of the current_node
    possible_moves.map! do |move|
      @nodes += 1
      Move.new(move[0],move[1],current_node.depth+1,nil,current_node)
    end

    current_node.children = possible_moves


    unless current_node.depth+1 == @max_depth
      current_node.children.each do |move|
        add_move(move)
      end
    end

  end

end

# tree = MoveTree.new([3,3],1)
# tree.inspect
