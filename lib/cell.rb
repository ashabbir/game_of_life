class Cell
  attr_reader :x, :y

  def initialize(ops)
    @x = ops[:x]
    @y = ops[:y]
  end
end
