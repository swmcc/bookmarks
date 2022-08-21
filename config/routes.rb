Rails.application.routes.draw do
  namespace :admin do
      resources :links

      root to: "links#index"
    end
  resources :links
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "links#new"

  get '/search', to: "links#search"
end
