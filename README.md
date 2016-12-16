# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)


Tingting Wang


What data structure is used to implement DFS?
  stack
What data structure is typically used to implement BFS?
  queue 
Which one can be done recursively? (the clue should be the data structure)
  DFS

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
  BFS

What is the difference between a tree and a graph?
  tree is hierarchical, graph isn't
=====================
Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

  starting at root, searching for x
  curr_node = root
  loop
    curr_node.children == x ? return x : curr_node = curr_node.children
    break if curr_node.children.nil
  end


Searching the same tree using BFS.

  starting at root, searching for x
  node = root
  enqueue(node)
  node contains x ? return node : enqueue node.children
  dequeue node


Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

  adjacency list
  array.each |list|
    list contains x? return node : next
  end

adjacency matrix
search matrix through each array (row)


Searching the same graph using BFS.

  adjacency list
  search first node for each list
  search second node for each list
  etcparen

  adjacency matrix
  search matrix through indexes (columns) 
