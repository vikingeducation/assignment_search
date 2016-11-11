# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Completed by Sampson Crowley and Luke Schleicher


What data structure is used to implement DFS?

  A stack or recursion

What data structure is typically used to implement BFS?

  A queue

Which one can be done recursively? (the clue should be the data structure)

  DFS

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?

  BFS

What is the difference between a tree and a graph?

  Graph can have cycles. Tree only has parent/child relationship. 

Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

  # add root to stack
  # add children to stack
  # choose leftmost child
  # add children
  # choose leftmost child
  # if no more children, go to next item on stack
  # until find the correct node

Searching the same tree using BFS.

  # seed queue with root
  # loop until find item
    # dequeue item
    # check if item is equal to the value
    # add children of dequeued item to queue


Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

  # add all "from vertices" to stack (in reverse)
    # add first "to vertex" of "from vertex" to stack
    # check if correct node
    # else add the next "to vertex" in the list to the stack
    # until end of list

Searching the same graph using BFS.

  # add all first column "to vertices" to queue
    # dequeue first "to vertex"
    # if correct, return
    # if has child, enqueue child
    # dequeue next "to vertex"

Do not move on until you can comfortably pseudocode those processes! You'll find that a lot of operations you do with trees will resemble either BFS or DFS and that should immediately tell you the best way to solve them.


