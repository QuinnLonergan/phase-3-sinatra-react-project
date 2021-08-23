class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :users_id
      t.text :review
      t.datetime :date_posted
    end
  end
end

