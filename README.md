# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)
What data structure is used to implement DFS?
stack

What data structure is typically used to implement BFS?
queue

Which one can be done recursively? (the clue should be the data structure)
DFS

Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?
BFS

What is the difference between a tree and a graph?
In a tree nodes will not connect back to each other. Graphs do not have a hierarchical structure. 

Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

stack.push(head)
unless stack.empty?
current node = stack.pop
return node if target_data == data
Add children to stack unless children.nil?

Searching the same tree using BFS.

queue.enqueue(head)
unless queue.empty?
current node = queue.unqueue
return node if target_data == data
Add children to queue unless children.nil?

Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

Adjacency List
@head_list.each do |linked_list|
linked_list.search(data)


Searching the same graph using BFS.

@head_list.each_with_index do |linked_list, index|
counter = 0
while index <= counter
linked_list.crawl(index)
counter += 1
end

