require 'sidekiq/web'

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  resources :contacts, only: [:new, :create] 
  post "/product/message" => "products#email_product", as: :email_product
   get "products/terms_and_conditions", :to => "products#terms_and_conditions"
   get "products/privacy_policy", :to => "products#privacy_policy"
  resources :products do
    resources :comments
    resources :reviews
    
  end

  
  devise_for :users
   get "users/products/terms_and_conditions", :to => "products#terms_and_conditions"
  root to: 'products#index'
   
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/cancel' => 'devise/registrations#cancel'
  end 
  resources :categories

end
