class Grid < ApplicationRecord
  has_many :cells
  has_many :neighbour_cells, -> { where(alive: false) }

  def tick
    Transaction.start do
      (cells + neighbour_cells).each do |cell|
        cell.tick
      end
    end
    pp cells
    pp neighbour_cells
  end

  def start_game
    x = Random.rand(100)
    y = Random.rand(100)
    self.cells.create(x: x, y: y)
    Cell::NEIGHBOURS.each do |neighbour|
      self.cells.create(x: x + neighbour[0], y: y + neighbour[1], alive: [true, false].sample)
    end
    pp self.cells
    100.times do
      tick
    end
  end

end
