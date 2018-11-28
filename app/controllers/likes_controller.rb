class LikesController < ApplicationController
  def create
    @movie = Movie.find_or_initialize_by(code: params[:movie_code])
    
    unless @movie.persisted?
      movie_code = params[:movie_code]
      movie_hash = Tmdb::Movie.detail(movie_code)
      
      @movie.title = movie_hash['title']
      @movie.poster_path = movie_hash['poster_path']
      @movie.release_date = movie_hash['release_date']
      @movie.save
    end
    
    if params[:like] == 'like'
      current_user.like(@movie)
      flash[:success] = '商品をlikeしました。'
    end

    redirect_to root_path
  end
    

    
    

  def destroy
    
    @movie = Movie.find(params[:movie_id])
    
    if params[:like] == 'like'
      current_user.unlike(@movie) 
      flash[:success] = '商品のlikeを解除しました。'
    end
      redirect_to root_path
    
  
  end

end
