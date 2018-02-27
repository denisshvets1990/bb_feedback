Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'feedbacks#new'

  devise_for :admin_users, path: 'admin', controllers: { sessions: 'admin_users/sessions' }
  resources :feedbacks, only: %i[new create], path_names: { new: '/' }

  namespace :admin do
    resources :feedbacks, only: %i[index show] do
      resources :feedback_answers, only: %i[new create]
    end
  end
end
