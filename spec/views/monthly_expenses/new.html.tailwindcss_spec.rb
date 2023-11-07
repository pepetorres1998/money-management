require 'rails_helper'

RSpec.describe "monthly_expenses/new", type: :view do
  before(:each) do
    assign(:monthly_expense, MonthlyExpense.new(
      name: "MyString",
      description: nil,
      amount: "9.99"
    ))
  end

  it "renders new monthly_expense form" do
    render

    assert_select "form[action=?][method=?]", monthly_expenses_path, "post" do

      assert_select "input[name=?]", "monthly_expense[name]"

      assert_select "input[name=?]", "monthly_expense[description]"

      assert_select "input[name=?]", "monthly_expense[amount]"
    end
  end
end
