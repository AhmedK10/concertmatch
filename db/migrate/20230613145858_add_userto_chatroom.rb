class AddUsertoChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :user
  end
end
