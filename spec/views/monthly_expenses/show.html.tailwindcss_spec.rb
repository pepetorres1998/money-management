require 'rails_helper'

RSpec.describe "monthly_expenses/show", type: :view do
  before(:each) do
    assign(:monthly_expense, MonthlyExpense.create!(
      name: "Name",
      description: nil,
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
