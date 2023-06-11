class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :bio
      t.string :genre
      t.integer :age

      t.timestamps
    end
  end
end
