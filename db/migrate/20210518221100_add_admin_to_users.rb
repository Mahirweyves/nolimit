class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Admin, :boolean
  end
end
