require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = array.take(1).select {|el| el <= pivot}
    right = array.take(1).select {|el| el > pivot}
    return self.class.sort1(left) + [pivot] + self.class.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    left = QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    right = QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    array
  end
  # [(3),1,5,2,4]
  # [(3),1|5,2,4]
  # [(3),1,2|5,4]
  # [2,1,(3)|5,4]
  # [(2),1|]    [(5),4|]
  # [1,(2)|]    [4,(5)|]
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |i|
      if prc.call(array[i], pivot) <= 0
        array[pivot_idx + 1], array[i] = array[i], array[pivot_idx + 1]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
