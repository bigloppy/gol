class CreateGrids < ActiveRecord::Migration[7.0]
  def change
    create_table :grids do |t|
      t.timestamps
    end
  end
end
