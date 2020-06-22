class CreateEmployeesalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :employeesalaries do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :salary, null: false, foreign_key: true
      t.datetime :formonth
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
