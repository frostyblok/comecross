Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#login'
  get 'signup', to: 'sessions#signup'
  post 'create-user', to: 'sessions#create'
end
