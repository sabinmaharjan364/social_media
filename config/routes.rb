require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  namespace :user do
    resources :hostels
  end

  get "/hostels", to: "pages#hostel", as: :hostels
  # get "/search", to: "pages#search"
  # get "/hostel/:id", to: "pages#show", as: :hostel_show
  resources :hostels do
    resources :comments
  end
  # get 'hostels/:query' => 'pages#search', as: :hostel_searches
end
