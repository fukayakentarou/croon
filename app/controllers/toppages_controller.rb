class ToppagesController < ApplicationController
  def index
    @movies = Movie.order('updated_at DESC').page(params[:page]).per(28)
  end
end
