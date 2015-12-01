Node = Struct.new(:square, :distance, :predecessor, :next)

class LinkedList
  attr_accessor :head, :last

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
  end

  def add_node_to_end(square)
    if @head.nil?
      add_first_node(square)
    else
      new_node = Node.new(square)
      @last.next = new_node
      @last = new_node
    end
  end

  # No error handling
  # def find_node(index)
  #   counter = 0
  #   current_node = @head

  #   while counter < index
  #     current_node = current_node.next
  #     counter += 1
  #   end

  #   current_node
  # end

  private

  def add_first_node(square)
    @head = Node.new(square)
    @last = @head
  end
end
