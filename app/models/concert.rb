class Concert < ApplicationRecord
    
    validates :name, presence: true
    validates :date, presence: true
    validates :address, presence:true
    
    has_many :performances
    has_many :forums
    has_many :favorites
    has_many :users, through: :favorites
    has_many :comments, through: :forums
    
end
