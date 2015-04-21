Rails.application.routes.draw do

  resources :genres

  resource :session
  get "signin" => "sessions#new"
  get 'signup' => 'users#new'
  resources :users

  root "movies#index"
  get "movies/filter/:scope" => "movies#index", as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
