# assignment_search

## Efraim

Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

## Warmup 1: BFS and DFS Concepts

1. What data structure is used to implement DFS?

A Tree and a Graph, but the concept can be applied to any sequence that can be traversed.

2. What data structure is typically used to implement BFS?

Same as before.

3. Which one can be done recursively? (the clue should be the data structure)

The Tree.

4. Which one would you use to print a list of all the nodes in a tree or graph, starting with depth 1, then depth 2, then depth 3 etc.?

Any one of the two, but since I like recursion I'd use a Tree.

5. What is the difference between a tree and a graph?

The Tree is a data structure represented by nodes; these nodes may have parent and child nodes.

The Graph may be represented as nodes too, but they don't have a hierarchy between each other.

## Pseudocode

1. Searching a simple tree of nodes where each Node has an array of child nodes (some_node.children) using DFS.

```ruby
def depth_first_search(arr, obj)
  return if arr.nil?
  if arr.is_a? Array
    depth_first_search(arr[0], obj) || depth_first_search(arr[1..-1], obj)
  else
    arr if arr == obj
  end
end
```

2. Searching the same tree using BFS.

```ruby
def breadth_first_search(queue, obj)
  if queue.empty?
    nil
  else
    first, rest = queue[0], queue[1..-1]
    if first.is_a? Array
      rest.push(first[0])
      rest.push(first[1..-1])
      breadth_first_search(rest, obj)
    else
      return first if first == obj
      breadth_first_search(rest, obj)
    end
  end
end
```

3. Searching a graph (represented however you feel most comfortable -- Edge List, Adjacency List or Adjacency Matrix) using DFS.

Same concept as the upper code.

4. Searching the same graph using BFS.

Same concept as the upper code.
