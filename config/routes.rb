Rails.application.routes.draw do
  root to: 'alunos#index'

  resources :alunos, only: [:index, :show]
  resources :historicos, only: [:new, :create]
end
