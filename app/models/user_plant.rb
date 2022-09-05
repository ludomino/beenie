class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :personal_tasks
  has_many :tasks, through: :plants
end
