class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products 
  # Setup accessible (or protected) attributes for your model
  
  
  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false      
 
  validates :terms_of_service, acceptance: true
  validates :privacy_policy, acceptance: true
  validates_acceptance_of :terms_and_conditions

end
