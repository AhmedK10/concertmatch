class Addcitytoconcert < ActiveRecord::Migration[7.0]
  def change
    add_column :concerts, :city, :string
    add_column :concerts, :country, :string
  end
end
