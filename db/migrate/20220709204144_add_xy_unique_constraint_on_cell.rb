class AddXyUniqueConstraintOnCell < ActiveRecord::Migration[7.0]
  def change
    add_index :cells, [:x, :y], unique: true
  end
end
