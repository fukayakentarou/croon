class Movie < ApplicationRecord
    validates :code, presence: true, length: { maximum: 50 }
    validates :title, presence: true, length: { maximum: 50 }
    validates :poster_path, presence: true, length: { maximum: 50 }
    validates :release_date, presence: true, length: { maximum: 50 }
end
