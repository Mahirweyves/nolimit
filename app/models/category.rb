class Category < ApplicationRecord
	has_many :products
	
    extend FriendlyId
    friendly_id :category, use: :slugged

    resourcify
end
