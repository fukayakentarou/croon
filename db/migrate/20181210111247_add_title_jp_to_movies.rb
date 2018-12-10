class AddTitleJpToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :title_jp, :string
  end
end
