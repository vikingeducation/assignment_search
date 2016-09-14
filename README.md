# assignment_search
Marco?  Polo!

[A data structures and algorithms Ruby challenge from the Viking Code School](http://www.vikingcodeschool.com)

Tamal Riedman

1.  Stack
2.  Queue
3.  DFS
4.  BFS
5.  Tree would usually be much more organized, have direct relationship between parents and children, graph good for data that isn't easily organized, varying relationships, maybe no ROOT node

1.  Start at first node
      if no children, or all children visited already, move up to parent
      elsif there are children, go to the left one
        recurse
      end
    end

2.  Start at first node
      if children, index first level of children
        if there are children, index second level of children
          if there are children, index third level of children
            if no child levels remain
              stop
            end
          end
        end
      end
    end

3.  Start at first bucket
      mark source node read
      move to first child
        mark child read
        move to first child
          mark child read
          recurse...
        end
      end
    end

4.  Start at first bucket
      mark source read
      move to first child
        mark read
        move to second child of source
          mark read
          move to third child of source
            mark read
          end
        end
      end
      mark first child as source
        move to first child of new source
      end
      mark second child of original child as source
        move to that child
      end
      etc.
    end

Warmup II

Conceptually, each spot on a chess board will be a node. Knight will traverse the "nodes" of the board using depth-first search. Nodes cannot be visited twice, Search will end when all "nodes" have been visited.