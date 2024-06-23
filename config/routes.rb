Rails.application.routes.draw do
  resources :games
  get 'archive/index'
  get 'archive/checkout'
  get 'archive/search'
  get 'archive/collections'
  get 'archive/wishlist'

  post 'games/set_platform_filter'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Defines the root path route ("/")
  root "games#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
