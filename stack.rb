class Stack

	def initialize
		@values = []
	end

	def push(thing)
		index_to_push = @values.length
		@values[index_to_push] = thing
	end

	def pop
		index_to_pop = @values.length - 1
		temp_array = []
		(index_to_pop).times do |index|
			temp_array[index] = @values[index]
		end
		thing = @values[index_to_pop]
		@values = temp_array
		thing
	end

	def peek
		index_to_peek = @values.length - 1
		@values[index_to_peek]
	end

	def empty?
		@values.length == 0
	end
end