class World
  def initialize
   @cells = [] 
  end

  def cells
    @cells  
  end

  def spawn_cell(ops)
    new_cell = Cell.new ops
    cells << new_cell
    new_cell
  end
end
