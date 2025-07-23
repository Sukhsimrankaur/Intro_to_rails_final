Rails.application.routes.draw do
  resources :mosquito_traps do
    resources :mosquito_readings, only: [:index, :show]
  end

  get '/about', to: 'pages#about'
  root 'mosquito_traps#index'
end
