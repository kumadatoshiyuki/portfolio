Rails.application.routes.draw do

  devise_for :users, controllers: {
     registrations: 'users/registrations',
    sessions: 'users/sessions',
     passwords: 'users/passwords',
  }
  devise_scope :user do
    get '/', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
    # post 'sigunup', to: 'devise/sessions#destroy'
  end
  scope :users do
    get '/top' => 'users#top'
    post 'user_notes/confirm' => 'user_notes#confirm'
    resources :user_notes, only: [:new, :index, :create, :show]
    get '/meals/calendar' => 'meals#calendar'
    get '/meals/chart' => 'meals#chart'
    resources :meals, only: [:index]
  end
  resources :users

  namespace :admins do
    devise_for :users,
    path_prefix: 'admins',
    path: '',
    controllers: {
      registrations: "admins/registrations",
      sessions: "admins/sessions",
      # passwords: 'admins/passwords'
    }
  end
  scope :admins do
    get '/top' => 'admins#top', as: 'admins_top'
    resources :news
    resources :admin_notes
  end
  resources :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root "users#top"
end
