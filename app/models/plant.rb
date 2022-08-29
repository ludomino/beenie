class Plant < ApplicationRecord
  belongs_to :category
  has_many :tasks
  has_many :user_plants
end
