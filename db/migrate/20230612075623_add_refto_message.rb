class AddReftoMessage < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :chatroom, foreign_key: true
  end
end
