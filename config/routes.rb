Rails.application.routes.draw do
  resources :games do
    collection do
      post :set_platform_filter
    end

    collection do
      post :set_publisher_filter
    end
  end

  get 'archive/index'
  get 'archive/checkout'
  get 'archive/search'
  get 'archive/collections'
  get 'archive/wishlist'

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "games#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
