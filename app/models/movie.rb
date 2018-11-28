class Movie < ApplicationRecord
    validates :code, presence: true, length: { maximum: 50 }, uniqueness: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :poster_path, presence: true, length: { maximum: 100 }
    validates :release_date, presence: true, length: { maximum: 100 }
 
    
    has_many :likes
    has_many :users, through: :likes
    
    has_many :reviews
end
