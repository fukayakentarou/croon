class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true, length: { maximum: 300 }
end
