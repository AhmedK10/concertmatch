class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.string :name
      t.string :address
      t.text :summary
      t.string :image
      t.timestamp :date

      t.timestamps
    end
  end
end
