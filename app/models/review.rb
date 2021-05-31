class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user  

	extend FriendlyId
    friendly_id :rating, use: :slugged
end
