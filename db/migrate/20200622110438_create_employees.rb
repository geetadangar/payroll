class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :department
      t.string :PAN
      t.string :PF
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
      t.references :company, null: false, foreign_key: true
    end
  end
end
