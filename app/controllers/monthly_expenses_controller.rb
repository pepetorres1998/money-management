class MonthlyExpensesController < ApplicationController
  before_action :set_monthly_expense, only: %i[ show edit update destroy ]

  # GET /monthly_expenses
  def index
    @monthly_expenses = MonthlyExpense.order(created_at: :desc)
  end

  # GET /monthly_expenses/1
  def show
  end

  # GET /monthly_expenses/new
  def new
    @monthly_expense = MonthlyExpense.new
  end

  # GET /monthly_expenses/1/edit
  def edit
  end

  # POST /monthly_expenses
  def create
    @monthly_expense = MonthlyExpense.new(monthly_expense_params)

    if @monthly_expense.save
      flash.now[:notice] = "MonthlyExpense was successfully created."
      render turbo_stream: [
        turbo_stream.prepend("monthly_expenses", @monthly_expense),
        turbo_stream.replace(
          "form_monthly_expense",
          partial: "form",
          locals: { monthly_expense: MonthlyExpense.new }
        )
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monthly_expenses/1
  def update
    if @monthly_expense.update(monthly_expense_params)
      flash.now[:notice] = "MonthlyExpense was successfully updated."
      render turbo_stream: [
        turbo_stream.replace(@monthly_expense, @monthly_expense)
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /monthly_expenses/1
  def destroy
    @monthly_expense.destroy
    flash.now[:notice] = "MonthlyExpense was successfully destroyed."
    render turbo_stream: [
      turbo_stream.remove(@monthly_expense)
    ]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_expense
      @monthly_expense = MonthlyExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_expense_params
      params.require(:monthly_expense).permit(:name, :description, :amount)
    end
end
