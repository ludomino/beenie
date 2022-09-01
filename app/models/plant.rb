class Plant < ApplicationRecord
  belongs_to :category
  has_many :tasks, dependent: :destroy
  has_many :user_plants, dependent: :destroy
  has_one_attached :image
end
