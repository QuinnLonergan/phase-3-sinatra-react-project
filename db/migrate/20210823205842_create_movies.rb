class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.string :name
      t.integer :year
      t.string :img_url
      t.string :run_time
      t.string :genre
      t.text :plot
      t.float :rating
    end
  end
end