Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  namespace :user do
    resources :hostels
  end

  get "/hostels", to: "pages#hostel"
  get "/hostel/:id", to: "pages#show", as: :hostel_show
  
end
