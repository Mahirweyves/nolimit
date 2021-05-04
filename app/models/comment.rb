class Comment < ApplicationRecord
	belongs_to :product

	validates :name, :comment, presence: true
end
