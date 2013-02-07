class Cell
  attr_reader :x, :y, :world 

  def initialize(ops)
    @x = ops[:x]
    @y = ops[:y]
    @world = ops[:world]
  end

  def neighbors
    data = []
    world.cells.each do |cell|

      # North West
      data << cell if self.x == cell.x+1 && self.y == cell.y-1

      # North
      data << cell if self.x == cell.x && self.y == cell.y-1

      # North East
      data << cell if self.x == cell.x-1 && self.y == cell.y-1


      # West
      data << cell if self.x == cell.x+1 && self.y == cell.y

      # Middle is not check

      # East
      data << cell if self.x == cell.x-1 && self.y == cell.y


      #South West
      data << cell if self.x == cell.x+1 && self.y == cell.y+1

      #South
      data << cell if self.x == cell.x && self.y == cell.y+1

      #Sourth East
      data << cell if self.x == cell.x-1 && self.y == cell.y+1
    end

    data
  end

  def die!
    world.cells.delete_if{|c| c == self}
  end
end
