class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
