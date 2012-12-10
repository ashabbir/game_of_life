require 'spec_helper'

describe Cell do
  let(:world){World.new}

  it "a cell should exist at 5,5" do
    cell = world.spawn_cell(x: 5, y: 5) 
    cell.x.must_equal 5
    cell.y.must_equal 5
  end

  it "cell should exist in the world" do
    cell = world.spawn_cell(x:5, y:5)
    world.cells.include?(cell).must_equal true
  end
end

describe "Rule #1 Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
  let(:world){World.new}

  it "should have less than two neighbors" do
    cell = world.spawn_cell x:5, y:5
    cell.neighbors.count < 2
  end
end
