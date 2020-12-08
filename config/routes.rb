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
    post 'sigunup', to: 'devise/sessions#destroy'
  end


  get '/about' => 'homes#about'
  get '/admin' => 'admins#top'
  get '/admin/new' => 'admins#new'
  get '/admin/index' => 'admins#index'
  get '/admin/:id' => 'admins#show', as: 'admin_show'
  resources :users, only: [:top, :new, :create, :index, :show, :edit, :destroy]
  resources :user_notes, only: [:top, :new, :create, :index, :show, :edit, :destroy]
  # get '/user' => 'users#index', as: 'index_users'


  # root 'users#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root "users#top"
end
