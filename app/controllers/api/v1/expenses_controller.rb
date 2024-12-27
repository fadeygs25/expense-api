class Api::V1::ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    expenses = current_user.expenses.page(params[:page]).per(10)
    render json: expenses
  end

  def create
    expense = current_user.expenses.new(expense_params)
    if expense.save
      render json: expense, status: :created
    else
      render json: { errors: expense.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :date, :description, :category_id)
  end
end
