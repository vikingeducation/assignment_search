# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Jeremy Vermast

1) What data structure is used to implement DFS?
     - Stack

2) What data structure is typically used to implement BFS?
     - Queue

3) Which one can be done recursively? (the clue should be the data structure)
     - DFS

4) Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
     - BFS, because its traversal, depth by depth

5) What is the difference between a tree and a graph?
     - a tree is similar to a graph with hierarchy, parents and child, a graph is more unordered.


Pseudocode : 

search tree DFS : 
 - start with the root node, add to the stack

 - repeat the process until find the value or no more nodes to check

		 - pop the stack and compare with the value
		 - return the value if match, otherwise, add current_node.children to 	the stack
 

 (using a stack makes sure that we are traversing an entire branch before checking an other one)


search tree BFS :
 - start with the root node, add to the queue

 - repeat the process until find the value or no more nodes to check

		 - take the first queue value, and compare with the value we are 
		   looking for
		 - return the value if match, otherwise, add current_node.children to 	the queue

(using a queue makes sure that we are checking all the same level children of one node before going one level deeper)


searching a graph (Adjacency List) using DFS :
 - start with the first value node, add to the stack
 - skip the node if mark as visited
 - compare the node with the value we are looking for
 - return if match
 - otherwise mark as visited
 - call the DFS function on each neighbors



searching a graph (Adjacency List) using BFS :
 - add the first vertex to the queue
 - set the first vertex depth to 0

 Repeat until the queue is empty : 
 	 - pop the front value of the queue, set as current_node
	 - compare the current node with the value we are looking for
	 - if match, return the value
	 - else, set the depth of current_vertex equal to depth
	 - add each neighbors to the queue if they don't have depth
	 - up the depth + 1
	 - repeat until find the match, or no more vertices to check










