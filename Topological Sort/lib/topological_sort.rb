require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  khans_algo(vertices)
  # tarjans_algo(vertices)
end

def khans_algo(vertices)
  sorted = []
  in_edge_count = {}
  top_queue = []
  vertices.each do |vertex|
    top_queue.push(vertex) if vertex.in_edges.empty?
    # in_edge_count[vertex] = vertex.in_edges.count
  end
  until top_queue.empty?
    current = top_queue.shift
    sorted << current
    current.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      remove_edge(edge)
      # in_edge_count[to_vertex] -= 1
      # if in_edge_count[to_vertex] == 0
      if to_vertex.in_edges.empty?
        top_queue.push(to_vertex)
      end
    end
    vertices.delete(current)
  end
  vertices.empty? ? sorted : []
end

def remove_edge(edge)
  edge.to_vertex.in_edges.delete(edge)
end

def tarjans_algo(vertices)
  sorted = []
  visited = Set.new

  vertices.each do |vertex|
    dfs(vertex, sorted, visited) unless visited.include?(vertex)
  end
  sorted
end

def dfs(vertex, sorted, visited)
  visited.add(vertex)
  vertex.out_edges.each do |edge|
    new_vert = edge.to_vertex
    dfs(new_vert, sorted, visited) unless visited.include?(new_vert)
  end
  sorted.unshift(vertex)
end
