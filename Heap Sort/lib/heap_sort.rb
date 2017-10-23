require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new {|a, b| -1 * (a <=> b)}
    window = 0
    until window == self.length
      BinaryMinHeap.heapify_up(self, window, window + 1, &prc)
      window += 1
    end
    window = self.length
    until window == 0
      self[0], self[window - 1] = self[window - 1], self[0]
      BinaryMinHeap.heapify_down(self, 0, window - 1, &prc)
      window -= 1
    end
  end
end
