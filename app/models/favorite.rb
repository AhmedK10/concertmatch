class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :concert
  
  validates :user, presence: true
  validates :concert, presence: true
  validates :user_id, uniqueness: { scope: :concert_id } #It checks for the uniqueness of the combination of user_id and concert_id, ensuring that there are no duplicate favorite records.
  
end
