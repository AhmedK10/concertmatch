class AddArtistToConcert < ActiveRecord::Migration[7.0]
  def change
    add_column :concerts, :artist, :string
    add_column :concerts, :genre, :string
  end
end
