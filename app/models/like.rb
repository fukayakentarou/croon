class Like < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  def self.ranking
    self.group(:movie_id).order('count_movie_id DESC').limit(10).count(:movie_id)
  end
end
