class Category < ApplicationRecord
  has_many :plants
  has_many :messages
end
