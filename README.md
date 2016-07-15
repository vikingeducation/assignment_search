# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)


BFS AND DFS WARM-UP

What data structure is used to implement DFS?
- stack
What data structure is typically used to implement BFS?
- queue
Which one can be done recursively? (the clue should be the data structure)
- DFS
Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
- BFS
What is the difference between a tree and a graph?
The nodes in a tree only go in one direction, whereas the path in a graph can cycle back to the same vertex it started with.

PSEUDCODE

1) DFS Tree of Nodes

- tree of nodes
- each node: array of nodes
- search this tree using DFS

# Iterative
depth_first_search(node)
  nodes = Stack.new
  current = node
  until Stack.empty?
    until current.children.nil?
      current.visit
      nodes.push(node)
      current = current.node
    end
  end
end

# Recursive
search(value, node)
  return node if value = node.value
  until node.children is nil
  node.children.each do |child|
    search(value, child)
  end
end

2) BFS Tree


                 A
               B   C
              D E F G
            H  I   J
 
# Iterative
breadth_first_search(node)
  nodes = Queue.new
  current = node
  until Queue.empty?
    until current.children.all? { |c| c.visited? }
      current.children.each do |child|
        child.visit
        Queue.enqueue(child)
      end
    end
    current = Queue.dequeue
  end
end

3.) DFS Graph

matrix.each do |i|
  matrix[i].each do |j|
    return j if val = j
  end
end

4. BFS Graph

matrix.first.each_index do |i|
  matrix.each_row do |row|
    return row[i] if val = row[i]
  end
end