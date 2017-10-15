Rails.application.routes.draw do
  

  get 'register' => 'users#new', as: 'register'

  post 'register' => 'users#create'

  get 'login' => 'sessions#new', as: 'login'

  post 'login' => 'sessions#create'

  get 'show/:id' => 'users#show', as: 'user'

  delete 'logout' => 'sessions#destroy', as: 'logout'

end