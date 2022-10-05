class RemoveTypeFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :type, :integer, default: 0
  end
end
