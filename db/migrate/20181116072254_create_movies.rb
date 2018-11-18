class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :code
      t.string :title
      t.string :poster_path
      t.date :release_date

      t.timestamps
    end
  end
end
