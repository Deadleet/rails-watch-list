class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_uniqueness_of :list_id, :scope => [:movie_id]
  validates :comment, length: { minimum: 6 }
  validates :list, presence: true
  validates :movie, presence: true
end
