
class Queue
  def initialize (data = [])
    @data = data
    @e_cursor = 0
    @d_cursor = 0
  end

  def dequeue
    # take off from the left
    if @d_cursor == @e_cursor
      puts "EmptyQueue"
      return
    end

    retval = @data[@d_cursor]
    @data[@d_cursor] = nil
    @d_cursor += 1
    retval
  end

  def enqueue( elt )
    # add to the right
    @data[@e_cursor] = elt
    @e_cursor += 1
  end

  def peek
    @data[@d_cursor]
  end

  def empty?
    @d_cursor == @e_cursor
  end

end