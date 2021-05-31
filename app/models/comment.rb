class Comment < ApplicationRecord
	belongs_to :product

	validates :name, :comment, presence: true

	extend FriendlyId
    friendly_id :name, use: :slugged
end
