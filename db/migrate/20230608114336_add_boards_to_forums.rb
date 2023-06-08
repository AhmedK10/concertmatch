class AddBoardsToForums < ActiveRecord::Migration[7.0]
  def change
    add_column :forums, :board, :integer
  end
end
