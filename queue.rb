class Queue
  def initialize
    @data = []
  end

  def enqueue(input)
    new_array = Array.new(@data.size + 1)
    new_array[0] = input
    (@data.size).times do |index|
      new_array[index + 1] = @data[index]
    end
    @data = new_array
  end

  def dequeue
    last_item = @data[last_index]
    new_array = Array.new(last_index)
    last_index.times do |index|
      new_array[index] = @data[index]
    end
    @data = new_array
    last_item
  end

  def empty?
    @data.size == 0
  end

  private

  def last_index
    @data.length - 1
  end
end

# string = "String"
# queuey = Queue.new
#
# string.chars.each do |letter|
#   queuey.enqueue(letter)
# end
#
# result = ""
# until queuey.empty?
#   result += queuey.dequeue
# end
#
# puts result
