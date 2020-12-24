Rails.application.routes.draw do

    devise_for :users, controllers: {
     registrations: 'users/registrations',
    # sessions: 'users/sessions',
    passwords: 'users/passwords',
  }

  devise_scope :user do
    get '/', to: 'devise/sessions#new'
    post '/', to: 'devise/sessions#create', as: 'login'
    delete 'logout', to: 'devise/sessions#destroy'
    # post 'sigunup', to: 'devise/sessions#destroy'
  end

  scope :users do
    get '/top' => 'users#top'
    post 'user_notes/confirm' => 'user_notes#confirm'
    get '/events' => 'user_notes#events'
    resources :user_notes, only: [:new, :index, :create]
    get 'user_notes/show' => 'user_notes#show', param: :date, as: 'user_note_show'
    get '/meals/calendar' => 'meals#calendar'
    get '/meals/chart' => 'meals#chart'
    resources :meals, only: [:index]
  end
  get '/events' => 'meals#events'
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
    get '/admin_notes' => 'admin_notes#top'
    # post 'admin_notes/confirm' => 'admin_notes#confirm'
    resources :news
  end

# /admins/admin_idネストさせたからadmin_idが入るようになった。
# /admins/admin_id/admin_note/:id => show
# params(admin_id)でURLからadmin_idを取得できる

  resources :admins do
    resources :admin_notes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
end
