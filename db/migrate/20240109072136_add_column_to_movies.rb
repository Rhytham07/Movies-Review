class AddColumnToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :user_id, :integer
  end
end
