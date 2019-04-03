class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 300 }
  
  belongs_to :user
  belongs_to :movie

end
