class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { Male: 0, Female: 1, Other: 2 }

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
