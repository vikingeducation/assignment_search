
require_relative "./Stack.rb"
require_relative "./Queue.rb"
require_relative "./move.rb"
require_relative "./valid_knight_moves.rb"

#BFS

class MoveTree

    def initialize (initial_square)
        @initial_square = initial_square
        @data_queue = Queue.new
        @move_finder = ValidKnightMoves.new
    end

    def BFS
        @data_queue.enqueue( Move.new( @initial_square ) )
        counter = 0
        until @data_queue.empty? && counter < 12
            print @data_queue.data.length
            current_move = @data_queue.dequeue
            @move_finder.square = current_move.square 
            legal_moves = @move_finder.run
            searchable_moves = legal_moves & current_move.ancestors
            print searchable_moves.length
            searchable_moves.each do | search_move_square |
                new_move = Move.new( search_move_square, current_move )
                @data_queue.enqueue( new_move )
                if new_move.depth == 63
                    @save_move = new_move
                    break
                end
            end
            counter += 1
        end
        print @data_queue.data
        puts @save_move
    end
end

mt = MoveTree.new("d3")
mt.BFS



