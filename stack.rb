class Stack

  def initialize(str)
    @stack = str.split('')
  end

  def push(item)
    index = @stack.length
    @stack[index] = item
  end

  def pop
    item = peek
    @stack = @stack[0..((@stack.length) -2)] unless empty?
    item
  end

  def peek
    @stack[@stack.length-1] unless empty?
  end

  def empty?
    @stack.size == 0
  end

end

# s = Stack.new('hello')
#
# new_array = []
# 5.times do
# new_array << s.pop
# end
# p new_array.join
