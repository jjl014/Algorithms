require "byebug"

class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
    @frog_top_down_cache = {
      0 => [[]],
      1 => [[1]]
    }
    @frog_super_cache = {}
    @knapsack_cache = {}
    @maze_solver_cache = {}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    odd_num = (2*(n-1)) - 1
    b_num = blair_nums(n - 1) + blair_nums(n - 2) + odd_num
    @blair_cache[n] = b_num
    b_num
  end

  def blair_nums_bottom_up(n)
    blair_cache = {1 => 1, 2 => 2}
    (3..n).each do |i|
      odd_num = (2 * (i - 1)) - 1
      blair_cache[i] = blair_cache[i - 1] + blair_cache[i - 2] + odd_num
    end
    blair_cache[n]
  end

  # blair_nums(4)
  # => b_nums(3) + b_nums(2) + 2*(4-1)-1 = 5
  # => b_nums(2) + b_nums(1) + 3 + b_nums(2) + 2*(3-1) - 1

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1,1],[2]],
      3 => [[1,1,1],[1,2], [2,1], [3]]
    }

    (4..n).each do |i|
      cache[i] = []
      (1..3).each do |jump|
        cache[i] += cache[i - jump].map {|set| set + [jump]}
      end
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_top_down_cache[n] if @frog_top_down_cache[n]
    frog_hops_top_down_helper(n-1)
    if n < 3
      one = @frog_top_down_cache[n - 1].map {|set| set + [1]}
      two = @frog_top_down_cache[n - 2].map {|set| set + [2]}
      @frog_top_down_cache[n] = one + two
    else
      one = @frog_top_down_cache[n - 1].map {|set| set + [1]}
      two = @frog_top_down_cache[n - 2].map {|set| set + [2]}
      three = @frog_top_down_cache[n - 3].map {|set| set + [3]}
      @frog_top_down_cache[n] = one + two + three
    end
    @frog_top_down_cache[n]
  end

  def super_frog_hops(num_stairs, max_stairs)
    cache = {
      0 => [[]]
    }
    return cache[num_stairs] if num_stairs < 1
    (1..num_stairs).each do |stair_num|
      cache[stair_num] = []
      (1..max_stairs).each do |step_distance|
        if stair_num - step_distance >= 0
          cache[stair_num] += cache[stair_num - step_distance].map {|step| step + [step_distance]}
        end
      end
    end
    cache[num_stairs]
  end

  def knapsack(weights, values, capacity)
    knapsack_table(weights, values, capacity)
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    matrix = Array.new(values.length) { Array.new(capacity + 1, 0) }
    (0...values.length).each do |i|
      (0..capacity).each do |cap_i|
        if cap_i < weights[i]
          matrix[i][cap_i] = matrix[i - 1][cap_i]
        else
          matrix[i][cap_i] = [
            values[i] + matrix[i - 1][cap_i - weights[i]],
            matrix[i - 1][cap_i]
          ].max
        end
      end
    end
    matrix[values.length - 1][capacity]
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
