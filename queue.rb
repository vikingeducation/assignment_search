class Queue
  attr_reader :queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    new_arr = [item]
    @queue.length.times { |n| new_arr[n+1] = @queue[n] }
    @queue = new_arr
  end

  def dequeue
    item = front_peek
    @queue = @queue[0..((@queue.length) -2)] unless empty?
    item
  end

  def front_peek
    @queue[(@queue.length) - 1]
  end

  def back_peek
    @queue[0]
  end

  def empty?
    @queue.length == 0
  end


end
