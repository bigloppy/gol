class Cell < ApplicationRecord
  belongs_to :grid
  NEIGHBOURS = [[-1, 1], [0, 1], [1, 1], [-1, 0], [1, 0], [-1, -1], [0, -1], [1, -1]]

  def tick
    die if underpopulated? || overpopulated?
    live if !underpopulated? && !overpopulated?
  end

  def underpopulated?
    alive_neighbours < 2
  end

  def overpopulated?
    alive_neighbours > 3
  end

  def alive_neighbours    
    return @_alive_neighbours if defined?(@_alive_neighbours)
    total_neighbours = 0
    Grid.transaction do
      NEIGHBOURS.each do |neighbour|
        if grid.cells.find_by neighbour_coordinates(neighbour)
          total_neighbours += 1
        end
      end
    end

    @_alive_neighbours = total_neighbours
    return @_alive_neighbours
  end

  def neighbour_coordinates(square)
    neighbour_x = square[0] + x
    neighbour_y = square[1] + y
    {x: neighbour_x, y: neighbour_y}
  end

  def die
    alive = false
    self.save
    self.class.delete(id) if alive_neighbours == 0
  end

  def live
    alive = true
    self.save
  end
end
