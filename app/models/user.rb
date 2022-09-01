class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :user_plants, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :personal_tasks, through: :user_plants
end
