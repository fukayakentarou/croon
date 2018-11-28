class User < ApplicationRecord
    has_secure_password
    
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
                
    
    has_many :likes
    has_many :like_movies, through: :likes, source: :movie
    
    has_many :reviews
   
    

    def like(movie)
        self.likes.find_or_create_by(movie_id: movie.id)
    end
    
    def unlike(movie)
        like = self.likes.find_by(movie_id: movie.id)
        like.destroy if like
    end
    
    def like?(movie)
        self.like_movies.include?(movie)
    end
    
    
    
end