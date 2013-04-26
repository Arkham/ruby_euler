triangle = [
  [ 75 ],
  [ 95, 64 ],
  [ 17, 47, 82 ],
  [ 18, 35, 87, 10 ],
  [ 20,  4, 82, 47, 65 ],
  [ 19,  1, 23, 75,  3, 34 ],
  [ 88,  2, 77, 73,  7, 63, 67 ],
  [ 99, 65,  4, 28,  6, 16, 70, 92 ],
  [ 41, 41, 26, 56, 83, 40, 80, 70, 33 ],
  [ 41, 48, 72, 33, 47, 32, 37, 16, 94, 29 ],
  [ 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14 ],
  [ 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57 ],
  [ 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48 ],
  [ 63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31 ],
  [  4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 ]
]

class TrianglePath
  attr_reader :triangle, :heuristic

  def initialize(triangle)
    @triangle = triangle
    build_heuristic!
  end

  def build_heuristic!
    result = [ triangle.last ]

    (height-2).downto(0) do |n|
      previous = result.first
      current = triangle[n].each_with_index.map do |elem, index|
        elem + [previous[index], previous[index+1]].max
      end
      result.unshift(current)
    end

    @heuristic = result
  end

  def height
    @height ||= triangle.length
  end

  def root_value
    triangle[0][0]
  end

  def max_heuristic(row, idx)
    next_row = triangle[row+1]
    heuristic_row = heuristic[row+1]
    max = heuristic_row[idx] > heuristic_row[idx+1] ? idx : idx + 1
    [ row+1, max, next_row[max] ]
  end

  def child_sum(row, idx)
    next_row = triangle[row+1]
    next_row[idx] + next_row[idx+1]
  end

  def max_path_sum
    total = root_value
    row, idx = 0, 0

    while row+1 < height
      row, idx, value = max_heuristic(row, idx)
      total += value
    end

    total
  end
end

tp = TrianglePath.new(triangle)
p tp.max_path_sum
