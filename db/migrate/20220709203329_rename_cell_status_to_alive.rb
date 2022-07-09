class RenameCellStatusToAlive < ActiveRecord::Migration[7.0]
  def change
    rename_column :cells, :status, :alive
  end
end
