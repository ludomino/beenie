class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :personal_tasks, dependent: :destroy
end
