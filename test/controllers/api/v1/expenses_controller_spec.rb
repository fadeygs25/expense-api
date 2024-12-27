require "rails_helper"

RSpec.describe Api::V1::ExpensesController, type: :controller do
  describe "GET #index" do
    it "returns success response" do
      user = create(:user)
      raise user.inspect
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new expense" do
      user = create(:user)
      sign_in user
      expense_params = { amount: 100, date: "2024-01-01", description: "Test expense", category_id: 1 }
      post :create, params: { expense: expense_params }
      expect(response).to have_http_status(:created)
    end
  end
end
