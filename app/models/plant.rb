class Plant < ApplicationRecord
  belongs_to :category
  has_many :tasks
  has_many :user_plants
  has_one_attached :image
end
