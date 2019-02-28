class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @reviews = Review.order('created_at DESC').page(params[:page]).per(10)
  end
  
  def edit
     @review = Review.find_by(id: params[:id])
  end
  
  def update
    @review = Review.find_by(id: params[:id])

    if @review.update(review_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @review.movie
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end
  
  def create
    @review = current_user.reviews.build(review_params)
    
    if @review.save
      @movie = @review.movie
      flash[:success] = 'reviewを投稿しました'
      redirect_to @movie
    else
      @movie = @review.movie
      @like_users = @movie.users
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
