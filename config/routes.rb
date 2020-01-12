Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: 'pages#home'
  # resources :people
  # resources :quizzes
  # resources :countries, only: [:show]

  namespace :api, as: nil, defaults: { format: :json } do
    namespace :v1, as: nil do
      resources :people, only: %i[index show]
    end
  end
end
