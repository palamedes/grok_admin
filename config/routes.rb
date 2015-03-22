GrokAdmin::Engine.routes.draw do

  get "/resource", to: "resource#index"

  root to: 'application#index'

end
