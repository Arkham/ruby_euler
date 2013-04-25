class LatticePath

  def initialize
    @lattice_cache = {}
  end

  def to_key(x, y)
    "#{x}_#{y}"
  end

  def get_cache(x, y)
    @lattice_cache[to_key(x, y)]
  end

  def set_cache(x, y, value)
    @lattice_cache[to_key(x, y)] = value
  end

  def lattice_path(x, y, limit)
    return 1 if x == limit && y == limit
    return get_cache(x, y) if get_cache(x, y)

    result = 0
    result += lattice_path(x+1, y, limit) if x < limit
    result += lattice_path(x, y+1, limit) if y < limit
    set_cache(x, y, result)
  end
end

lp = LatticePath.new
p lp.lattice_path(0, 0, 20)
