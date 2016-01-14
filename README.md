# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)


What data structure is used to implement DFS?
Stack

What data structure is typically used to implement BFS?
Queue

Which one can be done recursively? (the clue should be the data structure)
Depth First Search

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
Breadth

What is the difference between a tree and a graph?
Tree has a heirarchy between nodes, no cycles possible
Graph vertices can be in any arrangement, cycles possible

Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.
#Start at Root
#Add Root to Stack
#Loop until all nodes checked
  #pop off the Stack
  #if solution, return solution, else, continue. 
  #if nil, go to next loop
  #add children of node (in order of "worst to best", as defined by prompt)

Searching the same tree using BFS.
#start at root
#add root to queue
#Loop until queue is empty
  #check the items in the queue. if solution, return solution. else continue
  #add children to que
  #back to the loop
#if queue is empty there is no solution

Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.
#Start at first vertex
#Add vertex to stack
#Loop
  #pop off stack
  #check if solution
  #if solution, return solution. else continue.
  #next loop, if vertex has no more edges to follow
  #add vertices of untraversed edges of original vertex to stack
  #if stack empty, no solution

Searching the same graph using BFS.
#Start at first vertex
#Add vertex to queue
#Loop
  #dequeue
  #check if solution
  #if solution, return solution. else continue.
  #next loop, if vertex has no more edges to follow
  #enqueue vertices of untraversed edges of original vertex
#if queue is empty there is no solution
  
Do not move on until you can comfortably pseudocode those processes! You'll find that a lot of operations you do with trees will resemble either BFS or DFS and that should immediately tell you the best way to solve them.