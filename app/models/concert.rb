class Concert < ApplicationRecord
  validates :name, presence: true
  # validates :date, presence: true
  # validates :address, presence: true

  has_one_attached :photo
  has_many :forums, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
