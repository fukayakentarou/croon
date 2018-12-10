class ToppagesController < ApplicationController
  def index
    @movies = Movie.order('updated_at DESC').page(params[:page]).per(20)
  end
end
