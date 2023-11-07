class CreateMonthlyExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_expenses do |t|
      t.string :name, null: false
      t.decimal :amount, default: 0
      t.text :description

      t.timestamps
    end
  end
end
