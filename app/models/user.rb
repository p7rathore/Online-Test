class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable,:trackable
  # has_many :papers              
  has_many :answers ,dependent: :destroy     
  has_many :results,dependent: :destroy
end
