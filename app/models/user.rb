class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :interviews,dependent: :destroy
  enum gender: { "男性": 0, "女性": 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # validates  :name, presence:true     
end
