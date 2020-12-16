Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :complaints do
    collection do
      get :my_complaints
    end
    resources :complements, only: %i[new create]
    get 'ask_login', on: :collection
  end
  get 'help', to: 'pages#help'
end
