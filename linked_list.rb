require 'rainbow'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize(first_node = nil, last_node = nil)
    @head = first_node
    @tail = last_node
    @size = 0
  end

  def add_first_node(name, weight)
    @head = Node.new(name, weight)
    @tail = @head
  end

  def add_node(name, weight)
    if @head.nil?
      add_first_node(name, weight)
    else
      new_node = Node.new(name, weight)
      @tail.next = new_node
      @tail = new_node
    end
    @size += 1
  end

  def split_in_half
    start_list = LinkedList.new
    current_index = 0
    node = @head
    until current_index == size / 2
      start_list.add_node(node.name, node.weight)
      node = node.next
      current_index += 1
    end
    end_list = LinkedList.new(node.dup, @tail.dup)
    [start_list, end_list]
  end

  # This is O(n), in the worst case that index is the last index of the LinkedList.
  def find_node_at(index)
    current_index = 0
    node = @head
    until current_index == index
      puts current_index
      node = node.next
      current_index += 1
    end
    puts "returning node at #{current_index}"
    node
  end

  def insert_node_at(name, weight, index)
    before_node = find_node_at(index-1)
    after_node = before_node.next
    new_node = Node.new(name, weight, after_node)
    before_node.next = new_node
  end

  # This is O(n), since you have to traverse the length of the linked lisk to rearrange the "links" to point in the opposite direction. This method uses existing nodes and simply rearranges the links.
  def reverse
    current_node = @head
    @tail, @head = @head, @tail
    last_node = nil
    until current_node == nil
      next_node = current_node.next
      current_node.next = last_node

      last_node = current_node
      current_node = next_node
    end

  end

  def to_s
    nodes = []
    current_node = @head
    until current_node == nil
      nodes << "#{current_node.name}(#{Rainbow(current_node.weight).red})"
      current_node = current_node.next
    end
    nodes.join ", "
  end

  def find_name(name)
    current_node = @head
    counter = 1
    until current_node == nil
      if current_node.name == name
        puts "Searched for #{name} through #{counter} nodes"
        return current_node
      end
      current_node = current_node.next
      counter += 1
    end
    puts "Searched for #{name} through #{counter} nodes and failed"
    false
  end
end

Node = Struct.new(:name, :weight, :next) do def inspect
    "#{name} -> #{self.next.inspect || "nil"}"
  end
end
