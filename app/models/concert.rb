class Concert < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :address, presence:true
end
