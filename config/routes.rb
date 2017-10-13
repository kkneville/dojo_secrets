Rails.application.routes.draw do
  

  get 'register' => 'users#new', as: 'register'

  post 'register' => 'users#create'

  get 'login' => 'sessions#new', as: 'login'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', as: 'logout'

end