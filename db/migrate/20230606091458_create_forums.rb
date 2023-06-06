class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.integer :type
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
