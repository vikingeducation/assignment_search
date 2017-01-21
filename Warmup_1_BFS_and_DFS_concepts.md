# BFS and DFS Concepts

## Pseudocode the following:  

### Searching a simple tree of nodes where each Node has an array of child nodes(`some_node.children`) using DFS:

1. Put root node in `stack`
2. Do the following until stack is empty:
	1. Set `current` as `stack.pop`
	2. Return `current.value` if `current.value` is what we're looking for
	3. Push `current`'s child nodes onto end of `stack` 
4. Indicate the target was not found / return a value to that effect 

### Searching the same tree using BFS:  
1. Put root node in `queue`
2. Set `current` as `queue[0]`
3. Do the following until the `queue` is empty:
	1. Return `current` if `current.value` is what we're after
	2. Add `current`'s child nodes to end of `queue`
	3. Remove `current` from `queue`
	4. Set `current` as `queue[0]`
5. Indicate that target was not found / return a value to that effect

### Searching a graph using DFS: (stack)

#### Edge List: 
Description: Array where each row consists of the `from` and `to` vertex columns

1. Create a master list of the graph's `vertices[]`
2. Until `vertices[]` is empty: (this is in case there are isolated nodes)
	1. Return first item in `vertices[]` if it's our target
	2. Add first item in `vertices[]` to `stack[]`
	3. Until `stack[]` is empty: (this is the mechanism for traversing a vertex's edges)
		1. Set `current` as `stack.pop`'s `from` value
		2. Return `current.value` if it's our target  
		3. Mark `current` as visited  (either set `current.visited` as `true` or add to a `visited` list)  
		3. Get `current`'s adjacent vertices (i.e. the vertices in the corresponding `to` column) by iterating through `edge_list`:  
			a. Push adjacent vertices to top of `stack` 
				*if* they have **not** been visited	
		5. Remove `current` from `vertices[]` master list
4. Indicate that target was not found / return a value to that effect 


#### Adjacency List:
[node, node, node, node]

1. Put first item of `array` in `stack[]`
2. Until we've hit the end of the `array`:
	1. Return if `array[i]` is the vertex we want
	2. Until `stack[]` is empty:
		1. Set `current` as `stack.pop`
		2. Return if `current.value` is our target
		2. Mark `current` as visited
		3. Traverse the linked list to get `current`'s adjacent vertices 
		4. Add `current`'s adjacent vertices to top of stack *if* they have **not** been visited
	3. Indicate that the target was not found / return a value to that effect 


#### Adjacency Matrix
Description: A 2D array where each item in the array signifies an edge, and each row / column's index corresponds to a node's id)  

DFS on an adjacency matrix is kind of like a treasure hunt. You go through each column in a row and if there's something there, it means that you need to go check out the node whose id corresponds to the current column's index number.

1. Add first vertex to `stack[]`
2. Go through each `row` in the matrix:
	1. Return if `matrix[i]` is the vertex we want 
	2. Until `stack[]` is empty:
		1. Set `current` as `stack.pop`
		2. Return if `current.value` is our target
		3. Mark `current` as visited
		4. Go through the `columns` to get `current`'s adjacent vertices
		5. Add vertices to `stack` *if* they have **not** been visited
6. Indicate that target was not found / return a value to that effect


### Searching the same graph using BFS. (Queue)

#### Edge List:
The edge list is just a two-column array of `from` nodes and `to ` nodes. To do a BFS, we need (1) a list of all vertices, (2) a queue and (3) a list of visited edges

1. Create a master list of the graph's `vertices[]`
2. Until `vertices[]` is empty: (this is in case there are isolated nodes)
	1. Return first item in `vertices[]` if it's our target
	2. Add first item in `vertices[]` to `queue[]`
	3. Until `queue[]` is empty: 
		1. Set `current` as `stack.dequeue`'s `from` value
		2. Return `current.value` if it's our target  
		3. Mark `current` as visited  (either set `current.visited` as `true` or add to a `visited` list)  
		3. Get `current`'s adjacent vertices (i.e. the vertices in the corresponding `to` column) by iterating through `edge_list`:  
			a. Push adjacent vertices to back of `queue` 
				*if* they have **not** been visited	
		5. Remove `current` from `vertices[]` master list
4. Indicate that target was not found / return a value to that effect 

#### Adjacency List:
Description: A 1D array where each item is a linked list / node) 

1. For each `vertex` in the `array` 
	1. Return `vertex` if `current_vertex`'s value is what we're after
	2. Otherwise, traverse the linked list
		1. Return `current_vertex` if it's our target
2. Indicate that target was not found / return a value to that effect

#### Adjacency Matrix:

1. Add first vertex to `queue[]`
2. Go through each `row` in the matrix:
	1. Return if `matrix[i]` is the vertex we want 
	2. Until `queue[]` is empty:
		1. Set `current` as `queue.shift`
		2. Return if `current.value` is our target
		3. Mark `current` as visited
		4. Go through the `columns` to get `current`'s adjacent vertices
		5. Add vertices to `queue` *if* they have **not** been visited
6. Indicate that target was not found / return a value to that effect


			




