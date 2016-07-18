Based on a project I worked on at Viking Code School. Build a data tree with MoveTree.new([starting_x, starting_y], z_moves_deep), where z_moves_deep is the length of the chain of moves you would like to represent and starting_x and starting_y assume a 7x7 board (0 to 6 by index). MoveTree's #move instance method checks your 'x, y' input against an array of potential moves from the current position, which starts at your starting point. When you succssfully move, any new potential moves are printed to the screen. Repeat to explore the game board as desired.
KnightSearcher.new(tree) takes in a MoveTree object and allows the user to search for the path to any given position on the game board using a Breadth-First search (BFS) by calling #bfs_for on a KnightSearcher object and passing in x,y coordinates in the form of an array ([x, y]). 

TODO: Add Depth-First search (DFS) and a benchmarking method. 

Many thanks to Graham Turner for working on the initial stages of this project with me. 


(answers to warmup questions follow)
# assignment_search
Marco?  Polo!

A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

1. What data structure is used to implement DFS?
  Binary tree

2. What data structure is typically used to implement BFS?
  graph

3. Which one can be done recursively? (the clue should be the data structure)
  Depth First
4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
  BFS

5. What is the difference between a tree and a graph?
  Trees have heiarchy (root, parents, children etc.)



1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

(assuming a binary tree)
start at the root node
if root is node being searched for, return node
otherwise, add bad path to the stack (left or right depending on result of comparison of current node and desired node)
then add good path to the stack (the path that isn't the bad path)
call search function recursively, passing stack.pop to the function

2. Searching the same tree using BFS.

start at the root node
if root is desired node, return root
otherwise, enqueue children of root. enqueue good path first, bad path 2nd
pop the queue and pass that back into search function

3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

--using an  adjacency list--
check if 1st object is desired object
start at the first object linked to the 'first' object 
check if that is the desired object
add some sort of unique identifier from that object to an array of previously-searched-from objects (to avoid loops)
call search method recursively, passing the current object (instead of the original)



4. Searching the same graph using BFS.

--using an adjacency list--
start at a node, return if that is the desired node
otherwise, until child == nil, add a child to queue.
return if that child is the desired node
call search on next index object (recursively)
