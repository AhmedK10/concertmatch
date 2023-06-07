class User < ApplicationRecord
  # Include default devise modules. Others available are:
  ##:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :comments
  has_many :favorites
  has_many :forums
  
end
