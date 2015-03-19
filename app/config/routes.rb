Rails.application.routes.draw do

  get '/dashboard', to: 'grom_admin/dashboards#index'

end
