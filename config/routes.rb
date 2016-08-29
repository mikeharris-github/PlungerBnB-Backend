Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/create_user', to: 'users#create_user'
  post '/update_user', to: 'users#update_user'

  post '/request_plunger', to: 'users#request_plunger'

  post '/accept_job', to: 'users#accept_job'
  post '/complete_job', to: 'users#complete_job'

end
