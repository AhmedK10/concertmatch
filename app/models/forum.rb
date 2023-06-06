class Forum < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  enum type: { Accommodation: 0, Travel: 1, Buddies: 2 }

  validates :user, presence: true
  validates :concert, presence: true
end
