class AddColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :users_id, :user_id
    add_column :reviews, :recommend, :boolean
    add_column :reviews, :user_rating, :float
  end
end