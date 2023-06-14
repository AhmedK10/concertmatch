class Comment < ApplicationRecord
  belongs_to :forum
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
end
