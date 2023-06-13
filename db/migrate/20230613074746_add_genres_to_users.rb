class AddGenresToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :genres, :string
  end
end
