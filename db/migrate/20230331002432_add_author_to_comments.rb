class AddAuthorToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, polymorphic: true, null: false
  end
end
