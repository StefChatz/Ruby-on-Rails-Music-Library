Rails.application.routes.draw do
  devise_for :users
  resources :infos
  resources :songs

  root 'home#home'
  get 'home', to:'home#home'
  get 'songs', to: 'home#songs'
  get 'infos', to: 'home#infos'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
