Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :complaints, only: %i[index show new create] do
    resources :complements, only: %i[new create]
  end

  resources :complaint_categories, only: %i[new create]
end
