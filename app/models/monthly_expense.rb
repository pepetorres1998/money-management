class MonthlyExpense < ApplicationRecord
  validates_presence_of :name, :amount, :description
  validates :amount, numericality: { greater_than: 0 }
end
