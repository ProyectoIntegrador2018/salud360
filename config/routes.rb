Rails.application.routes.draw do

  devise_for :pacientes
  devise_for :nutriologos
  devise_for :users

  resources :sesions
  resources :meta, defaults:{format:'json'}

  mount RailsAdmin::Engine => '/user', as: 'rails_admin'
  get 'static_pages/home'
  get 'nutriologo_pages/mis_sesiones'
  get 'pacientes_pages/mis_sesiones'
  get '/users' => 'user#index', as: :user_root
  get '/nutriologos' => 'nutriologo_pages#index', as: :nutriologo_root
  get '/pacientes' => 'pacientes_pages#index', as: :paciente_root
  get 'pacientes_pages/programarCita'
  get 'pacientes_pages/ver_metas'
  get '/nutriologo_pages/mis_pacientes'


  get '/metas_paciente/:id', to: 'nutriologo_pages#metas_paciente'
  get '/metas_cita/:id', to: 'nutriologo_pages#metas_cita'
  get '/sesiones_paciente/:id', to: 'nutriologo_pages#sesiones_paciente'

  namespace :user do
    root 'user#index'
  end

  namespace :nutriologo do
    root 'nutriologo_pages#index'
  end

  namespace :paciente do
    root 'pacientes_pages#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home_page#home'
end
