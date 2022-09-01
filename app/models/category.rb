class Category < ApplicationRecord
  has_many :plants, dependent: :destroy
  has_many :messages, dependent: :destroy
end
