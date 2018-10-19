Rails.application.routes.draw do

  devise_for :pacientes
  devise_for :nutriologos
  devise_for :users
  mount RailsAdmin::Engine => '/user', as: 'rails_admin'
  get 'static_pages/home'
  get '/users' => 'user#index', as: :user_root

  namespace :user do
    root 'user#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home_page#home'
end
