# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Julia, Kit, and Ellen

1. What data structure is used to implement DFS? Use a stack to push highest priority nodes from the branch to the stack. Then pop the node and see if it matches the item you're searching for.

2. What data structure is typically used to implement BFS? Use a queue to push a whole level into it, then evaluate each node in order.

3. Which one can be done recursively? (the clue should be the data structure) DFS is recursive, you add to the call stack by going down a branch and executing in order. Then you go back to the last place you branched and continue.

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.? BFS

5. What is the difference between a tree and a graph? Trees have a given hierarchy (root, children, leaves). Graph has no hierarchy, any node can be connected to any other node.


PSEUDOCODE!
1. Search tree using DFS, where each Node has an array of child nodes (some_node.children) using DFS.

  - Add the root node to a stack

  - Repeat the following steps until the stack is empty:
  - Pop the top node off the stack, and assign that as the current node.
  - Compare the current node to the search value. Return the value if it matches.
  - Place each child of the current node onto a stack.
  - Repeat

2. Searching the same tree using BFS.

  - Add the root node to a queue

  - Repeat the following steps until the queue is empty:
  - Pop the first node off the queue, and assign that as the current node.
  - Compare the current node to the search value. Return the value if it matches.
  - Place add each child to the back of the queue.

3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

  Adjacency List:

  - Add the first node to a stack

  - Repeat the following steps until the stack is empty:
  - Pop the top node off the stack, and assign that as the current node.
  - Compare the current node to the search value. Return the value if it matches.
  - Mark the current node as having been searched.
  - Loop through each node in the current node's adjacency list, adding them to the stack if they have not been marked.
  - Repeat

4. Searching the same graph using BFS.

  Adjacency List:

  - Add the first node to a queue
  - Set the first node's depth to 0.

  - Repeat the following steps until the queue is empty:
  - Pop the front node off the queue, and assign that as the current node.
  - Compare the current node to the search value. Return the value if it matches.
  - Mark the current node with the current depth.
  - Loop through each node in the current node's adjacency list:
    - Ignore them if they already have a depth, otherwise:
    - Assign each node's depth to equal the current nodes depth plus 1.
    - Add them to the queue.
  - Repeat


  KNIGHT'S TRAVAILS PSEUDOCODE:

    x x x x x x x x 
    x x x x x x x x 
    x x x x x x x x 
    x x x x x x x x 
    x x x x x x x x 
    x x x x x x x x 
    x x x x x x x x 

  start square: pair of coordinates
  end square: pair of coordinates
  board = 8x8

  building the tree:
  - start square is root node
  - each child node is a possible move within the board
  - each move is a node, with :data being (:x,:y, :depth, :children, :parent)
  - don't make a node's children one of its parents (helps with redundancy)
  - final output: print all of the nodes' coordinates (using parent), total number of nodes
  - max depth: start with 10

