class Grid < ApplicationRecord
  has_many :cells

  def tick
    Transaction.start do
      cells.each do |cell|
        cell.tick
      end
    end
  end
end
