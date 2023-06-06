class Comment < ApplicationRecord
  belongs_to :thread
  belongs_to :user
end
