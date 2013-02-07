require 'spec_helper'

describe Cell do
  let(:world){World.new}
  let(:first_cell){ world.spawn_cell x: 4, y: 4 }

  it "a cell should exist at 5,5" do
    cell = world.spawn_cell x: 5, y: 5
    cell.x.must_equal 5
    cell.y.must_equal 5
  end

  it "cell should exist in the world" do
    cell = world.spawn_cell x: 5, y: 5 
    world.cells.must_include cell
  end

  it "should be able to access the current world" do
    cell = world.spawn_cell x: 0, y: 0 
    cell.world.must_equal world
  end

  it "should have a cell to the north" do
    cell = world.spawn_cell x: 4, y: 5
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the north east" do
    cell = world.spawn_cell x: 5, y: 5
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the north west" do
    cell = world.spawn_cell x: 3, y: 5
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the West" do
    cell = world.spawn_cell x: 3, y: 4
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the East" do
    cell = world.spawn_cell x: 5, y: 4
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the South West" do
    cell = world.spawn_cell x: 3, y: 3
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the South" do
    cell = world.spawn_cell x: 4, y: 3
    first_cell.neighbors.must_include cell
  end

  it "should have a cell to the Sourth East" do
    cell = world.spawn_cell x: 5, y: 3
    first_cell.neighbors.must_include cell
  end
end

describe "Life Rules" do
  describe "1. Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    let(:world){World.new}

    it "should die when there are less than two neighbors" do
      cell1 = world.spawn_cell x: 10, y: 10
      cell2 = world.spawn_cell x: 10, y: 11
      cell1.neighbors.count.must_be :<, 2

      world.tick!
      cell1.must_respond_to :die!
      world.cells.wont_include cell1
    end
  end

  #describe "2. Any live cell with two or three live neighbours lives on to the next generation."
  #describe "3. Any live cell with more than three live neighbours dies, as if by overcrowding."
  #describe "4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction."
    
 
end

describe "UI" do
  let(:world){World.new}

  it "should print a board with the current cells" do
    world.spawn_cell x:3, y: 3 
    lambda {print world.render}.must_output "------\n------\n------\n---*--\n------\n------"
  end
end
