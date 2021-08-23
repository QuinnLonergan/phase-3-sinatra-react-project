class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :fav_movie
      t.datetime :date_joined
      t.string :profile_pic
    end
  end
end
