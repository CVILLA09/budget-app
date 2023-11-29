Rails.application.routes.draw do
  get 'static_pages/splash'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # You can set the root path to a controller and action of your choice, such as:
  root to: 'static_pages#splash'

  resources :categories do
    resources :purchases, only: [:new, :create, :show]
  end
  
  # If you have other actions for purchases that are not nested within categories, you can define them like this:
  resources :purchases, except: [:new, :show, :index]

  # The 'up' route can stay if it's required by your application's health check.
  get "up" => "rails/health#show", as: :rails_health_check
end
