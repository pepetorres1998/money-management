class MonthlyExpense < ApplicationRecord
  validates_presence_of :name, :amount, :description
end
