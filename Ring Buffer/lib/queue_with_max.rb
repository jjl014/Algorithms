# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max = 0
    @max_arr = []
    @length = 0
  end

  def enqueue(val)
    @store.push(val)
    @max_arr.push(val)
    @max = val if val > @max
    @length += 1
  end

  def dequeue
    if length > 0
      @length -= 1
      @store.pop
      check_max
    else
      "index out of bounds"
    end
  end

  def max
    @max
  end

  def length
    @length
  end

  def check_max
    max = 0
    @max_arr.each do |n|
      if n > max
        max = n
      end
    end
    @max = max
  end
end
