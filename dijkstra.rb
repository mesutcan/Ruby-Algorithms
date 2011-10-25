# Assign to every node a tentative distance value: set it to zero for our initial node and to infinity for all other nodes.
# Mark all nodes except the initial node as unvisited. Set the initial node as current. Create a set of the unvisited nodes called the unvisited set consisting of all the nodes except the initial node.
# For the current node, consider all of its unvisited neighbors and calculate their tentative distances. For example, if the current node A is marked with a distance of 6, and the edge connecting it with a neighbor B has length 2, then the distance to B (through A) will be 6+2=8. If this distance is less than the previously recorded distance, then overwrite that distance. Even though a neighbor has been examined, it is not marked as visited at this time, and it remains in the unvisited set.
#When we are done considering all of the neighbors of the current node, mark it as visited and remove it from the unvisited set. A visited node will never be checked again; its distance recorded now is final and minimal.
# The next current node will be the node marked with the lowest (tentative) distance in the unvisited set.
# If the unvisited set is empty, then stop. The algorithm has finished. Otherwise, set the unvisited node marked with the smallest tentative distance as the next "current node" and go back to step 3.
# Using adjacent lists and using a binary heap, pairing heap and Fibonacci heap as a priority queue to implement extracting minimum efficiency.


require 'pqueue'

class Dijkstra
INFINITY = 1 << 32

def self.dijkstra(source, edges, weights, n)
 visited = Array.new(n, false)
 shortest_distances = Array.new(n,infinity)
 previous = Array.new(n,nil)
 pq = PQueue.new(proc {|x,y| shortest_distances[x] < shortest_distances[y]})

pq.push(source)
visited = true
shortest_distances = 0

while pq.size != 0
 v=pq.pop
 visited[v] = true
 if edges[v]
  edges[v].each do |w|
   if !visited[w] and shortest_distances[w] > shortest_distances[v] + weights[v][w]
    shortest_distances[w]=shortest_distances[v] + weights[v][w]
    previous[w] = v
    pq.push(w)
   end
  end
 end
end
return [shortest_distances, previous]
end
end


