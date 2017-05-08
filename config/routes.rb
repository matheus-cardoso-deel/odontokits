Rails.application.routes.draw do
  
  get '/angular', to: 'static_pages#angular' # Hello World
  
  root 'static_pages#home'
  
  get  '/help',    to: 'static_pages#help', as: 'helf' #esse helf serve para usar no helf_path e helf_url
  
  get  '/about',   to: 'static_pages#about'
  
  get  '/contact', to: 'static_pages#contact'
  
  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  post 'authenticate_user', to: 'authentication#authenticate_user'
  post 'authenticate_aluno', to: 'authentication#authenticate_aluno'


  resources :users
  resources :alunos do
    resources :kits,              shallow: :true, except: [:index] do
      resources :feeds,              shallow: :true, only: [:create, :index]
      resource :download, only: [:show]
    end
  end
  
  get '/kits', to: 'kits#index'

end