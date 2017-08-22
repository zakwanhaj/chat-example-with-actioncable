Rails.application.routes.draw do
  resource :session, only: %i(show create destroy)
  resources :messages, only: %i(index create update destroy)

  root 'main#index'
end
