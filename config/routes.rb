Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace :admin do
    resources :links
    root to: 'links#index'
  end
  resources :links
  root to: "links#index"
  get '/search', to: "links#search"  
end
