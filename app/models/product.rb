class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many_attached :images, dependent: :destroy

  validates_acceptance_of :terms_and_conditions
  validates :terms_and_conditions, acceptance: true
  validates :name, :description, :images, :address,
        :company_name, :telephone_number, :price, presence: true
  
  validates :name, uniqueness: { case_sensitive: false }
  
  
    
    def self.search_by(search_term)
      where("LOWER(name) LIKE :search_term OR LOWER(company_name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    resourcify
end