class Performance < ApplicationRecord
  belongs_to :artist
  belongs_to :concert
end
