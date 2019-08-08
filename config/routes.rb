Rails.application.routes.draw do
  root to: 'albums#index'
  resources :albums do
    resources :songs
    resources :artists
  end
end
