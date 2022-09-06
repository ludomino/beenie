class Plant < ApplicationRecord
  belongs_to :category
  has_many :tasks
  has_many :user_plants
  has_one_attached :image

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    category: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
