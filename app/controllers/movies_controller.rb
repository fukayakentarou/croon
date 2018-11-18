class MoviesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @movies = []
    @keyword = params[:keyword]
    if params[:keyword]
    @search = Tmdb::Search.new
    @search.resource('movie')
    @search.query(@keyword)
    @search.fetch
    result = @search.fetch.first
    
      
    
    movie = Movie.new(read(result))
    @movies << movie
    end
  end

  
  
  
  private
   
  def read(result)
    
    code = result['id']
    title = result['title']
    poster_path = result['poster_path'].gsub('?_ex=128x128', '')
    release_date = result['release_date']
  
  
    {
      code: code,
      title: title,
      poster_path: poster_path,
      release_date: release_date,
    }
  end
end
