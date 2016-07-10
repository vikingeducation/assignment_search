# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
What data structure is used to implement DFS?
DFS is implemented using Stacks

What data structure is typically used to implement BFS?
BFS is implemented using Queues

Which one can be done recursively? (the clue should be the data structure)
DFS can be done recursively

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS is used to print nodes at each level

What is the difference between a tree and a graph?
A tree has a root. Graph has no root.
Tree is unidirectional, usually there no pointer to the parent. Graph can have pointer both ways.

Psuedo code:
Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

1. Starting at the root, pick a child and examine it. Return if the solution is found.
2. If no solution is found, pick a child of that child and examine it, returning if the solution is found.
3. Continue until either the solution or a dead end is reached.
4. If a dead end is reached, go back until we find a node/vertex with a child we haven't searched yet and perform DFS on that child.

Searching the same tree using BFS.

1. Put the initial node into our queue and start checking every node in the queue.
2. For the first node of the queue, return if it matches our search criteria. If not, add each of its children to the end of the queue.
3. Continue dequeuing nodes and checking them until the target is located or the queue empties (failure).


Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.


dfs_search(root, target_node)

  mark root as visited
  
  return target_node if target_node == root
  
  push root on to the stack
  
  while stack not empty
  
    visit all unvistied neighbors of item on top of stack.
    
    mark each one as visited and push to the stack
    
    if no unvisited neighbors present, pop the stack
    
  end
  
end


Searching the same graph using BFS.


bfs-search(root, target_node)
  mark root as visited
  
  return target_node if target_node == root
  
  loop do
  
    enque/mark visited neighbors of root node to the Queue
    
    update cur_working_node to top if queue and deque until Queue is empty
    
  end
  
end
