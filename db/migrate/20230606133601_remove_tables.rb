class RemoveTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :performances
    drop_table :artists
  end
end
