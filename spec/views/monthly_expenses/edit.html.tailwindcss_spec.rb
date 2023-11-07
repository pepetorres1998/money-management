require 'rails_helper'

RSpec.describe "monthly_expenses/edit", type: :view do
  let(:monthly_expense) {
    MonthlyExpense.create!(
      name: "MyString",
      description: nil,
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:monthly_expense, monthly_expense)
  end

  it "renders the edit monthly_expense form" do
    render

    assert_select "form[action=?][method=?]", monthly_expense_path(monthly_expense), "post" do

      assert_select "input[name=?]", "monthly_expense[name]"

      assert_select "input[name=?]", "monthly_expense[description]"

      assert_select "input[name=?]", "monthly_expense[amount]"
    end
  end
end
