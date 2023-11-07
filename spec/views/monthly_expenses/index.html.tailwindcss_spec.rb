require 'rails_helper'

RSpec.describe "monthly_expenses/index", type: :view do
  before(:each) do
    assign(:monthly_expenses, [
      MonthlyExpense.create!(
        name: "Name",
        description: nil,
        amount: "9.99"
      ),
      MonthlyExpense.create!(
        name: "Name",
        description: nil,
        amount: "9.99"
      )
    ])
  end

  it "renders a list of monthly_expenses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
