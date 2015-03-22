GrokAdmin::Engine.routes.draw do

  resources :resources, only: [:index, :update]

  root to: 'application#index'

end
