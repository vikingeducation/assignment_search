# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Authors:
Leo, Adrian

  What data structure is used to implement DFS?

    Stack.

  What data structure is typically used to implement BFS?

    Queue

  Which one can be done recursively? (the clue should be the data structure)

    Stack.

  Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?

    BFS

  What is the difference between a tree and a graph?

    - A tree is a special data structure who's root is connected to its children all the way down to its leaves.
    - A graph is a more general form of data structure which uses nodes but their edges are not bound by directionality(unlike trees).

  Next, pseudocode the following processes with enough detail to be clear:

  Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

    start at the root, add root to stack
    compares search to root value
    if not same, continue down first child
    compare first child to value, add first child to stack
    do this until there is no more first children
    remove nodes off stack until you reach a node with multiple children.
      removes first child node then adds new first child to stack
      continue...
    when root has no more children to search, over.

  Searching the same tree using BFS.

    start at root, enqueue root
    enqueue all root's children
    dequeue root & compare to value
    enqueue all children's children
    dequeue root's children & compare to value
    continue...
    when no more children, over.

  Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

    go through Adjacency list starting at first index of array,
    iterate through linked list
    next array
    continue...


  Searching the same graph using BFS.

    go through Adj list starting at first index of array
    look at first node on linked list
    next arr till all arr's are looked at
    back to first array to see 2nd node on linked list, etc...
