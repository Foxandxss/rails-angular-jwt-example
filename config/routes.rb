Rails.application.routes.draw do
  namespace :api do
    resources :messages, only: [:index, :create, :destroy]
  end

  match '/auth/register',     to: 'auth#register',     via: 'post'
  match '/auth/authenticate', to: 'auth#authenticate', via: 'post'
end