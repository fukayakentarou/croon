class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @movies = Movie.find(@ranking_counts.keys)  
    @movies = Kaminari.paginate_array(@movies).page(params[:page]).per(20)
  end
end


# ランキングの一覧を上位１０件お気に入りの数と一緒に表示したい。