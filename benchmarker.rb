require_relative './knight_searcher'

module KnightsTravails
  class Benchmarker
    def run_benchmark(num_times)
      if block_given?
        start_time = Time.now
        num_times.times { yield }
        end_time = Time.now
        time_taken = end_time - start_time

        puts "Your method ran #{num_times} times in #{time_taken} seconds."
        puts "Average run time per method call: #{time_taken / num_times.to_f}s."
      else
        puts "Nothing to benchmark."
      end
    end
  end
end

if __FILE__ == $0
  include KnightsTravails

  # construct the MoveTree
  puts "Constructing move tree.."
  move_tree = MoveTree.new([0, 0], 10)
  move_tree.inspect

  # initialize the KnightSearcher
  searcher = KnightSearcher.new(move_tree)

  # now run our benchmarks
  benchmarker = Benchmarker.new
  num_times = 1000
  target_square_1 = [7, 7]
  target_square_2 = [6, 6]
  target_square_3 = [5, 5]

  puts "\nRunning BFS benchmark #{num_times} times to #{target_square_1}.."
  searcher.moves_taken_to(searcher.bfs_for(target_square_1))
  benchmarker.run_benchmark(num_times) { searcher.bfs_for(target_square_1)}

  puts "\nRunning DFS benchmark #{num_times} times to #{target_square_1}.."
  searcher.moves_taken_to(searcher.dfs_for(target_square_1))
  benchmarker.run_benchmark(num_times) { searcher.dfs_for(target_square_1)}

  puts "\nRunning BFS benchmark #{num_times} times to #{target_square_2}.."
  searcher.moves_taken_to(searcher.bfs_for(target_square_2))
  benchmarker.run_benchmark(num_times) { searcher.bfs_for(target_square_2)}

  puts "\nRunning DFS benchmark #{num_times} times to #{target_square_2}.."
  searcher.moves_taken_to(searcher.dfs_for(target_square_2))
  benchmarker.run_benchmark(num_times) { searcher.dfs_for(target_square_2)}

  puts "\nRunning BFS benchmark #{num_times} times to #{target_square_3}.."
  searcher.moves_taken_to(searcher.bfs_for(target_square_3))
  benchmarker.run_benchmark(num_times) { searcher.bfs_for(target_square_3)}

  puts "\nRunning DFS benchmark #{num_times} times to #{target_square_3}.."
  searcher.moves_taken_to(searcher.dfs_for(target_square_3))
  benchmarker.run_benchmark(num_times) { searcher.dfs_for(target_square_3)}
end
