class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.string :token
      t.integer :role
      t.integer :phone
      t.string :name
      t.date :birthdate
      t.string :job_title
      t.text :professional_experience
      t.text :education
      t.integer :application_count
      t.string :linked_url
      t.string :company_name
      t.string :company_url
      t.text :about_company
      t.integer :jobs_count

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
