Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/home', to: 'pages#home', as: :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :items do
    resources :reservations, only: [:new, :create, :index, :show]
    collection do
      get 'myreservations', to: 'reservations#my_reservations'
    end
  end
end
