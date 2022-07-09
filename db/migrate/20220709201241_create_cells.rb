class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer :y, null: false
      t.integer :x, null: false
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
