Rails.application.routes.draw do
  resources :folks, only: [:create, :index, :show]
  resources :messages, only: [:create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
