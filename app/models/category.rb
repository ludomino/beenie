class Category < ApplicationRecord
  has_many :plants
  has_many :messages
  has_one_attached :picture
end
