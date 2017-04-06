# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
Ann Allan

1)  What data structure is used to implement DFS?
-- Stack

2)  What data structure is typically used to implement BFS?
-- Queue

3)  Which one can be done recursively? (the clue should be the data structure)
--DFS

4)  Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
-- BFS

5)  What is the difference between a tree and a graph?
-- A tree is a type of graph having only one path between any to verticies so there can be no loops or cycles.

PSEUDOCODE
1)  Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS
  a.  start with root node and compare to target
  b.  if they match return root node, else push children into stack from "worst" to "best"
  c.  pop first element on stack and compare to target.  
  d.  if they match return element else push its children into stack from "worst" to "best"
  e.  repeat until target found or no more nodes

2)  Searching the same tree using BFS.
    a.  start with root node and compare to target
    b. if they match return root node, else enqueue children
    c.  dequeue first element and compare to target
    d.  if they match return element else enqueue children
    e.  dequeue next element and repeat until target found or no more nodes


3)  Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
    a.  choose one vertex and iterate through edges until you find target or move to next one.

4)  Searching the same graph using BFS.
    a. use nested loops to iterate through each path until target found or iteration complete.

KNIGHT"S PSEUDOCODE
a.  Establish the board as a 2D array of verticies
b.  create method that takes two vertex args of where to start and target
c.  define helper method of possible moves
d.  add record to node of depth from root
e.  iterate through possible moves until target hit
