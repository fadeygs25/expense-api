class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, :date, :description, presence: true
end
