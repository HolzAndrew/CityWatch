Rails.application.routes.draw do
  resources :cities do
  resources :videos
  resources :officers
end
  
root 'cities#index'

post 'login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end



