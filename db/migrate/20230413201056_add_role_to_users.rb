class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      ## Database authenticatable
      t.string :role, null: false, default: "user"
    end
  end
end
