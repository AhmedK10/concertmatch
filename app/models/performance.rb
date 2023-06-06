class Performance < ApplicationRecord
  belongs_to :artist
  belongs_to :concert
  
  validates :artist, presence: true
  validates :concert, presence: true
  
  has_many :comments, through: :concert
  has_many :users, through: :concert, source: :favorites

end
