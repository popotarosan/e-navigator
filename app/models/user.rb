class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :interviews
  enum gender: { male: 0, female: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # validates  :name, presence:true     
end
