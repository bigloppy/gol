class AddCellsToGrid < ActiveRecord::Migration[7.0]
  def change
    add_reference :cells, :grid, null: false, foreign_key: true
  end
end
