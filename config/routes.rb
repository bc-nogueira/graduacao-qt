Rails.application.routes.draw do
  root to: 'alunos#index'

  resources :alunos, only: [:index, :show]
end
