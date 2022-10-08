class AddFollowingsCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :followings_count , :integer, default: 0
  end
end
