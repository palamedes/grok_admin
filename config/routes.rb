GrokAdmin::Engine.routes.draw do

  get "/resources", to: "resources#index"

  root to: 'application#index'

end
