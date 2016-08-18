class Benchmark

	attr_reader :time

	def initialize

		@time = Time.now

	end


	def elapsed_time

		return ( Time.now - @time )

	end

end