# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative "topological_sort"
require_relative "graph"
require 'byebug'

def install_order(arr)
  graph = []
  (1..arr.max[0]).each do |n|
    graph << Vertex.new(n)
  end

  arr.each do |el|
    from_vert = graph[el[1] - 1]
    to_vert = graph[el[0] - 1]
    Edge.new(from_vert, to_vert)
  end

  topological_sort(graph).map {|v| v.value}
end
