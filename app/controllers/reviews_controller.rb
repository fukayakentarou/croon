class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
  @review = current_user.reviews.build  # form_for 用
  @reviews = current_user.reviews.order('created_at DESC').page(params[:page])  
  end

  def create
    @review = current_user.reviews.build(review_params)
    
    if @review.save
      @movie = @review.movie
      flash[:success] = 'reviewを投稿しました'
      redirect_to @movie
    else
      @movie = @review.movie
      @reviews = @movie.reviews.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'reviewの投稿に失敗しました。'
      render 'movies/show'
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = 'reviewを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def correct_user
    @movie = current_user.reviews.find_by(id: params[:id])
    unless @movie
      redirect_to root_url
    end
  end
  
  
  def review_params
    params.require(:review).permit(:content,:movie_id)
  end
end
