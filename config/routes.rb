Rails.application.routes.draw do

  devise_for :pacientes
  devise_for :nutriologos
  devise_for :users

  resources :sesions
  mount RailsAdmin::Engine => '/user', as: 'rails_admin'
  get 'static_pages/home'
  get 'nutriologo_pages/mis_sesiones'
  get '/users' => 'user#index', as: :user_root
  get '/nutriologos' => 'nutriologo_pages#index', as: :nutriologo_root

  namespace :user do
    root 'user#index'
  end

  namespace :nutriologo do
    root 'nutriologo_pages#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home_page#home'
end
