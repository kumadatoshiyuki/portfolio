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

  resources :admins do
    resources :admin_notes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end


  get '/contact_book/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/static/admin" => "static#admin"
  get "/static/index.html" => "static#index"
  get "/static/index2.html" => "static#index2"
  get "/static/index3.html" => "static#index3"
  get "/static/form.html" => "static#form"
  get "/static/form_advanced.html" => "static#form_advanced"
  get "/static/tables.html" => "static#tables"
  get "/static/tables_dynamic.html" => "static#tables_dynamic"
  get "/static/general_elements.html" => "static#general_elements"
  get "/static/media_gallery.html" => "static#media_gallery"
  get "/static/typography.html" => "static#typography"
  get "/static/icons.html" => "static#icons"
  get "/static/glyphicons.html" => "static#glyphicons"
  get "/static/widgets.html" => "static#widgets"
  get "/static/invoice.html" => "static#invoice"
  get "/static/inbox.html" => "static#inbox"
  get "/static/calendar.html" => "static#calendar"
  get "/static/chartjs.html" => "static#chartjs"
  get "/static/chartjs2.html" => "static#chartjs2"
  get "/static/morisjs.html" => "static#morisjs"
  get "/static/echarts.html" => "static#echarts"
  get "/static/other_charts.html" => "static#other_charts"
  get "/static/fixed_sidebar.html" => "static#fixed_sidebar"
  get "/static/fixed_footer.html" => "static#fixed_footer"
  get "/static/kitchen_sink" => "static#kitchen_sink"
  get "/static/kitchen8_sink" => "static#kitchen8_sink"
  get "/static/contacts.html" => "static#contacts"
end
