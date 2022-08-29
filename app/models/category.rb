class Category < ApplicationRecord
  has_many :plats
  belongs_to :chatroom
end
