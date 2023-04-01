class AddDefaultValueToCommentsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :comments_counter, 0
  end
end
