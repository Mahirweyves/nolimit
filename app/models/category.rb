class Category < ApplicationRecord
	has_many :products
	def category_name
    category.name
  end
end
