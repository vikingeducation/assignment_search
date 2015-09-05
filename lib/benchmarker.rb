class Benchmarker
	attr_accessor :searcher

	def initialize(searcher=nil)
		@searcher = searcher
	end

	def the_works(n)
		results = run(n)
		analysis = analyze(results)
		print(analysis)
	end

	def print(analysis)
		stack = [analysis]
		begin
			h = stack.pop
			h.keys.each do |key|
				if h[key].is_a?(Hash)
					stack.push(h[key])
				else
					puts "#{key}: #{h[key]}"
				end
			end
		end until stack.empty?
	end

	def analyze(results)
		{
			:quicker => quicker_of(results),
			:time => {
				:time_difference => time_difference_of(results),
				:bfs => results[:bfs][:time],
				:dfs => results[:dfs][:time]
			},
			:moves => {
				:average_difference => average_difference_of(results),
				:examples => examples_of(results)
			}
		}
	end

	def run(n)
		bfs = search(n, :bfs_for)
		dfs = search(n, :dfs_for)
		{
			:bfs => bfs,
			:dfs => dfs
		}
	end

	def search(n, type)
		max = searcher.tree.depth
		moves = []
		before = Time.now
		(n**2).times do |i|
			x = i / max**0 % max
			y = i / max**1 % max
			moves << searcher.send(type, x, y)
		end
		{
			:time => Time.now - before,
			:moves => moves
		}
	end

	private
		def quicker_of(results)
			results[:bfs][:time] < results [:dfs][:time] ? 'Breadth First Search' : 'Depth First Search' 
		end

		def time_difference_of(results)
			bfs_time = results[:bfs][:time]
			dfs_time = results[:dfs][:time]
			greater = bfs_time > dfs_time ? bfs_time : dfs_time
			lesser = bfs_time < dfs_time ? bfs_time : dfs_time
			greater.to_f - lesser.to_f
		end

		def average_difference_of(results)
			n = length_of(results)
			differences = 0.0
			n.times do |i|
				bfs_move = results[:bfs][:moves][i].length - 1
				dfs_move = results[:dfs][:moves][i].length - 1
				greater = bfs_move > dfs_move ? bfs_move : dfs_move
				lesser = bfs_move < dfs_move ? bfs_move : dfs_move
				differences += (greater - lesser).to_f
			end
			differences / n.to_f
		end

		def examples_of(results)
			n = length_of(results)
			n = [rand(1..n), 5].min
			examples = []
			n.times do |i|
				bfs_moves, dfs_moves = results[:bfs][:moves][i], results[:dfs][:moves][i]
				examples << {
					:move => "#{searcher.tree.start}->#{bfs_moves.last}",
					:bfs => {
						:num_moves => bfs_moves.length - 1,
						:moves => bfs_moves
					},
					:dfs => {
						:num_moves => dfs_moves.length - 1,
						:moves => dfs_moves
					}
				}
			end
			examples
		end

		def length_of(results)
			bfs = results[:bfs][:moves]
			dfs = results[:dfs][:moves]
			bfs.length == dfs.length ? bfs.length : 0
		end
end