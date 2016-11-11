# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Alexa and Jake!

1. DFS uses stack
2. BFS uses queue
3. DFS can be recursive
4. BFS to print a given depth at at time
5. Tree has heirarchy (parents and children). Graphs are any data set with linked nodes

Using DFS - simple tree of nodes

Start at root
	push it on the stack and pop it off
	run .children on it
		Push its children onto the stack
		pop them off
			stack.pop

Using BFS - simple tree of nodes

Start at root
	push it into the queue
	pop it off
	run .children on it
		put children in the queue
		pops from the front of the queue

Searching a graph using DFS

Start at given node
Go to first element of that array
Push all immediate nodes on to the stack
Pop off first node that shows up in array
	Go to its immediate nodes and add all of its children to the stack
	Continue in this manner: we get all nodes onto the stack and look at one directly
	Until we get to a node with no children
	If the node isn't the anwer it pops off and we move to its sibling node(if exists)
	and we continue in this manner

Searching a graph using BFS

Start at given node and go down its array
@ each node that node has to get pushed into a queue
those nodes immediate nodes then get pushed into the queue
