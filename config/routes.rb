Rails.application.routes.draw do
  resource :session, only: %i(show create destroy)
  resources :channels, only: %i(index show)
  resources :messages, only: %i(create)

  root 'main#index'
end
