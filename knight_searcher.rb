require_relative 'knight.rb'

class KnightSearcher

  def initialize(tree)
    @tree = tree
  end


end


k = KnightSearcher.new(Move)

def bfs_for(array)
  found_move = find_move(array)
  puts "#{found_move.depth} Moves:"
  move = found_move
  while move.parent
    puts "#[{move.parent.x}, #{move,parent.y}]"
    move = move.parent
  end
end

def find_move(array)
  current = @starting_move
  queue = [current]
  until queue.empty?
    current = queue.pop
    return current if array == [current.x, current.y]
    current.children each do |child|
      queue.unshift(child)
    end
  end
end




        if valid_move?(current.x + move[0], current.y + move[1])
          new_move = Move.new(current.x + move[0], current.y + move[1], depth+1, [], current)
          current.children << new_move
          queue.unshift(new_move)
        end
      end
      current = queue.pop
    end



