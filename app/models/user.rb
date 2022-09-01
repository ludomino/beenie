class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :user_plants
  has_many :favorites_plants, through: :user_plants, source: :plant
  has_many :favorites_categories, through: :favorites_plants, source: :category

  has_many :messages
  has_many :personal_tasks, through: :user_plants
end
