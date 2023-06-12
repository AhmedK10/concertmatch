class AddReftoMessage < ActiveRecord::Migration[7.0]
  def change
    def change
      create_table :messages do |t|
        t.references :chatroom, foreign_key: true
        t.references :user, foreign_key: true
      end
  end
end
