
require_relative "./Stack.rb"
require_relative "./Queue.rb"
require_relative "./move.rb"
require_relative "./valid_knight_moves.rb"

#BFS

class MoveTree

    def initialize (initial_square)
        @initial_square = initial_square
        @data_queue = Queue.new
        @stack = Stack.new
        @move_finder = ValidKnightMoves5x5.new
    end

    def BFS
        @data_queue.enqueue( Move.new( @initial_square ) )
        until @data_queue.empty?
            current_move = @data_queue.dequeue
            @move_finder.square = current_move.square 
            legal_moves = @move_finder.run
            searchable_moves = legal_moves.select{|sqr| !current_move.ancestors.include? sqr }
            searchable_moves.each do | search_move_square |
                new_move = Move.new( search_move_square, current_move )
                @data_queue.enqueue( new_move )
                if new_move.depth == 24
                    @save_move = new_move
                    print new_move.ancestors
                    return @save_move.ancestors
                end
            end
        end
    end


    def DFS
        @stack.push( Move.new( @initial_square ) )
        until @stack.empty?
            current_move = @stack.pop
            @move_finder.square = current_move.square 
            legal_moves = @move_finder.run
            searchable_moves = legal_moves.select{|sqr| !current_move.ancestors.include? sqr }
            searchable_moves.each do | search_move_square |
                new_move = Move.new( search_move_square, current_move )
                @stack.push( new_move )
                if new_move.depth == 24
                    @save_move = new_move
                    print new_move.ancestors
                    return @save_move.ancestors
                end
            end
        end
    end
end

mt = MoveTree.new("c3")
puts "BFS"
start = Time.now
mt.BFS
stop = Time.now
puts
puts "Computation time for BFS is: #{stop - start}"
puts 

puts "DFS"
stop = Time.now
mt.DFS
start = Time.now
puts
puts "Computation time for BFS is: #{stop - start}"



