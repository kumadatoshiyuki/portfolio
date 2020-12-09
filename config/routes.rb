Rails.application.routes.draw do

  devise_for :users, controllers: {
     registrations: 'users/registrations',
     sessions: 'users/sessions',
     passwords: 'users/passwords',
  }

  namespace :admins do
    devise_for :users,
    path: '',
    controllers: {
      registrations: "admins/registrations",
      sessions: "admins/sessions",
      passwords: 'admins/passwords'
    }
  end

  scope :admins do
    resources :news
    get '/' => 'admins#top'
    # get '/admin/new' => 'admins#new'
    get '/index' => 'admins#index'
    get '/:id' => 'admins#show', as: 'admins_show'
    # get '/admin/edit/:id' => 'admins#edit', as: 'admin_edit'
    post '/confirm' => 'admins#confirm', as: 'admins_confirm'
  end






  devise_scope :user do
    get '/', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
    post 'sigunup', to: 'devise/sessions#destroy'
  end



  # patch '/admin'
  resources :users, only: [:top, :new, :create, :index, :show, :edit, :destroy]
  resources :user_notes, only: [:top, :new, :create, :index, :show, :edit, :destroy]
  # get '/user' => 'users#index', as: 'index_users


  # get '/news' => 'news/index'


  # root 'users#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root "users#top"
end
