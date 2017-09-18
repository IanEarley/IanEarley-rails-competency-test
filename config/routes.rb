Rails.application.routes.draw do
  get 'pages/admin_dash'
  get 'users/edit'

  resources :news_articles, :categories, :users
  ## devise controllers for users
  devise_for :user, controllers: {  
    # confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # unlocks: 'users/unlocks',
  }, skip: [:sessions]

  ## custom routes for users
  as :user do  
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'news_articles#index'
end
