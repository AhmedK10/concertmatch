class Forum < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  validates :user, presence: true
  validates :concert, presence: true

  has_many :comments

end
