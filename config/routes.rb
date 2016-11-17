Rails.application.routes.draw do
  resources :folks, only: [:create, :index, :show]
  resources :messages, only: [:create, :index]
end
