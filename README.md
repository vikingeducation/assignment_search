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
    call holder variable
    compares search to root value
    
    do this until there is no more left children
      if 
      calls the left child of the root as root
      compares search to root value



    


  Searching the same tree using BFS.
  Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
  Searching the same graph using BFS.