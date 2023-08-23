Rails.application.routes.draw do
  #root to: "front#home"
   get "/dashboard" => "dashboard#index", as: :dashboard

  
  

  get "/accounts"     => "custom_accounts#index", as: :all_accounts 
  post "/accounts/new"     => "custom_accounts#create", as: :create_account
  get "/accounts/new"     => "custom_accounts#new", as: :new_account
  get "/account/edit/:id" => "custom_accounts#edit", as: :edit_account
  patch "/account/update/:id" => "custom_accounts#update", as: :udapte_account
  delete "/account/destroy/:id" => "custom_accounts#destroy", as: :destroy_account
  get "/account/delete/:id" => "custom_accounts#delete", as: :delete_account

 
  
 
  resources :features do 
    get "delete"
  end

  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles do 
    get "delete"
  end


  devise_for :accounts, path: '', controllers: { 
    registrations: "accounts/registrations",
    confirmations: 'accounts/confirmations',
    passwords: "accounts/passwords",
    sessions: "accounts/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
  }

  devise_scope :account do
    root to: 'accounts/sessions#new'
    
    authenticated :account do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'accounts/sessions#new', as: :unauthenticated_root
    end
  end

  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

end
