
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
        @move_finder = ValidKnightMoves4x4.new
    end

    def BFS
        @data_queue.enqueue( Move.new( @initial_square ) )
        counter = 0
        until @data_queue.empty?
            #print "#{@data_queue.data.length} queue data-length \n"
            current_move = @data_queue.dequeue
            @move_finder.square = current_move.square 
            legal_moves = @move_finder.run
            searchable_moves = legal_moves.select{|sqr| !current_move.ancestors.include? sqr }
            #print "#{searchable_moves.length} searchable-length \n"
            searchable_moves.each do | search_move_square |
                new_move = Move.new( search_move_square, current_move )
                puts new_move.depth
                @data_queue.enqueue( new_move )
                if new_move.depth == 63
                    @save_move = new_move
                    break
                end
            end
            counter += 1
        end
        #print @data_queue.data
        puts @save_move
    end


    def DFS
        @stack.push( Move.new( @initial_square ) )
        counter = 0
        until @stack.empty?
            #print "#{@stack.data.length} queue data-length \n"
            current_move = @stack.pop
            @move_finder.square = current_move.square 
            legal_moves = @move_finder.run
            searchable_moves = legal_moves.select{|sqr| !current_move.ancestors.include? sqr }
            # print "#{searchable_moves.length} searchable-length \n"
            searchable_moves.each do | search_move_square |
                new_move = Move.new( search_move_square, current_move )
                puts new_move.depth
                @stack.push( new_move )
                if new_move.depth == 15
                    print new_move.ancestors
                    print searchable_moves
                end
                if new_move.depth == 16
                    @save_move = new_move
                    puts
                    return @save_move.ancestors
                end
            end
            counter += 1
        end
        #print @data_queue.data
        puts @save_move
    end
end

mt = MoveTree.new("c2")
print mt.DFS



