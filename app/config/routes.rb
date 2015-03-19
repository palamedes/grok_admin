Rails.application.routes.draw do

  get '/test', to: 'grom_admin/dashboards#index'

end
