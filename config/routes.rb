GrokAdmin::Engine.routes.draw do

  get "/resources", to: "resource#index"

  root to: 'application#index'

end
