Rails.application.routes.draw do
  devise_for :pacientes
  devise_for :nutriologos
  devise_for :users

  resources :sesions
  resources :meta, defaults:{format:'json'}
  resources :documents
  resources :tips_ycomentarios
  resources :dieta

  mount RailsAdmin::Engine => '/user', as: 'rails_admin'
  get 'static_pages/home'
  get 'nutriologo_pages/mis_sesiones'
  get 'pacientes_pages/mis_sesiones'
  get '/users' => 'user#index', as: :user_root
  get '/admin', to: redirect('/users/sign_in')
  get '/nutriologos' => 'nutriologo_pages#mis_sesiones', as: :nutriologo_root
  get '/pacientes' => 'pacientes_pages#index', as: :paciente_root
  get 'pacientes_pages/programarCita'
  get 'pacientes_pages/ver_metas'
  get '/nutriologo_pages/mis_pacientes'
  get '/pacientes_pages/ver_comentarios'
  get '/pacientes_pages/ver_dietas'



  get '/metas_paciente/:id', to: 'nutriologo_pages#metas_paciente'
  get '/metas_cita/:id', to: 'nutriologo_pages#metas_cita'
  get '/sesiones_paciente/:id', to: 'nutriologo_pages#sesiones_paciente'
  get '/dietas_paciente/:id', to: 'nutriologo_pages#dietas_paciente'

  patch '/cambiar_objetivo/:id', to: 'nutriologo_pages#cambiar_objetivo'

  namespace :user do
    root 'user#index'
  end

  namespace :nutriologo do
    root 'nutriologo_pages#mis_sesiones'
  end

  namespace :paciente do
    root 'pacientes_pages#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
end
