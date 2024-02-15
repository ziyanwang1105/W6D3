class ChangeUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email
    remove_column :users, :name

    add_column :users, :username, :string, null:false
    add_index :users, :username, unique:true
  end
end
