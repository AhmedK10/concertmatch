class User < ApplicationRecord
  # Include default devise modules. Others available are:
  ##:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  enum gender: { male: 0, female: 1, other: 2 }

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :favorites, dependent: :destroy
  has_many :forums, dependent: :destroy
  has_many :comments, dependent: :destroy


  
    def age 
      current_age = Date.today.year -  date_of_birth.year
      current_age -= 1 if Date.today <  date_of_birth + current_age.years 
      current_age 
    end

  def favorited?(concert)
    concert.users.include?(self)
  end
  has_one_attached :photo
end
