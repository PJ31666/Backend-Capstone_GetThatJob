class AddApplicationCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :applications_count, :integer, default: 0
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
