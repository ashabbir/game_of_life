class World
  attr_reader :cells

  def initialize
   @cells = [] 
  end

  def spawn_cell(ops)
    ops[:world] = self
    new_cell = Cell.new ops
    cells << new_cell
    new_cell
  end

  def tick!
    cells.each do |cell|
      cell.die! if cell.neighbors.count < 2
    end
  end

  def render
    board = Array.new(7){Array.new(7,'-')}

    result = ""

    for i in 0..5
      for j in 0..5
        result << board[i][j]
      end
      result << "\n"
    end

    result.chomp
  end
end
