# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Joe Bernardi

What data structure is used to implement DFS?
	- Stack
What data structure is typically used to implement BFS?
	- Queue
Which one can be done recursively? (the clue should be the data structure)
	- DFS
Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
	- BFS
What is the difference between a tree and a graph? 
	- Tree has direct relationship of parents and children and is directed
	- graph can have varying relationships and will not necessarily have a ROOT node
Next, pseudocode the following processes with enough detail to be clear:

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

	PROGRAM DFS
		Push root node into an array/stack
		Pop that root and check if it is the desired result and record distance to eliminate cycles
		Return if so
		Else, check its children
			"better" children are placed at the top of the stack
			"worse" children are placed at the bottom of the stack
		Pop the child off the top of the stack and check if desired result and record the distance ( repeating of steps above )
	END

Searching the same tree using BFS.

	PROGRAM BFS
		Take the first node and place into the QUEUE
		Remove that node and check if desired solution, return if so
		If not, check for children of that node and place into the back of the QUEUE
		DEQUEUE the next child and check them for desired result
			check that node for children and add to the QUEUE
			mark each child with depth or value to eliminate cycle
	END


Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

	PROGRAM GraphDFS (ADJ List)

	Push the first Node in the graph (array) into the stack
	Return if desired solution
	Otherwise, place the next Node into the stack
	Check if that node by popping if off the stack and repeat
		determine the best and worst nodes and prioritize in the stack
	Once the first array's node's depth is incremented, proceed to the next element and repeat the process


	END


Searching the same graph using BFS.

	PROGRAM GraphBFS ( ADJ List )

		ENQUEUE the first node in the array
			check if solution and check if inspected, return if so
		ENQUEUE the children
		DEQUEUE the child at front and check solution
			return if solution
		If not, check that node for children and move them to back of queue
			each node inspected to be incremented with depth they were already checked

	END

