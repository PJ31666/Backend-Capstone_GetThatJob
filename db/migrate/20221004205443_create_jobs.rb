class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :job_title
      t.references :categories, null: false, foreign_key: true
      t.integer :type
      t.text :optional_requirements
      t.text :mandatory_requirements
      t.text :about_job
      t.integer :min_salary
      t.integer :max_salary
      t.boolean :job_status

      t.timestamps
    end
  end
end
