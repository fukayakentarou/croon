class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
  private
  
  def require_user_logged_in
      unless logged_in?
      redirect_to login_url
      end
  end
  
  def counts(user)
    @count_likes = @user.like_movies.count
  end
  
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
