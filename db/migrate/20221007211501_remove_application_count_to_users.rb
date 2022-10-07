class RemoveApplicationCountToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :application_count, :integer
  end
end
