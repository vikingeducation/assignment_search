# assignment_search
Marco?  Polo!
****
Frank Yu
****
[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

1.  Data structure used to implement DFS - Stack
2.  Data structure used to implement BFS - Queue
3.  DFS can be be done recursively
4.  BFS prints all the nodes on a tree or graph
5.  Trees vs. Graphs:
  1.  Trees have one path between nodes; graphs can have more than one path between vertices
  2.  Trees have a root node; a root node is nonexistent in graphs, so graphs are less structured


**** 
Searching a Tree using DFS:
1.  create an empty array for the stack
2.  push the root node onto the stack
3.  check if it is the solution we're looking for, and return if so
4.  if solution is not found, put the worst children onto the stack first and the best ones last, if any
5.  repeat from step 3 until solution is found or all nodes are searched

**** 
Searching a Tree using BFS:
1.  create an empty array for the queue
2.  put root node onto queue
3.  dequeue the root node and check if there is a match, return if so
4.  put children onto the end of the queue and check if there is a match, return if so
5.  for each children, repeat steps 3-4 until solution is found or all nodes are searched

