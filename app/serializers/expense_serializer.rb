class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :description, :category_name

  def category_name
    object.category.name
  end
end
