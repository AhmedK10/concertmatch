class Forum < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  enum type: { accommodation: 0, travel: 1, buddies: 2 }

  validates :user, presence: true
  validates :concert, presence: true

  has_many :comments
end
