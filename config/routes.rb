Rails.application.routes.draw do
  

  resources :countries do 
    get "delete"
  end
  resources :transfer_reasons do 
    get "delete"
  end
  resources :companies do 
    get "delete"
  end
  resources :withdrawals do 
    get "delete"
  end

  resources :identity_document_types, path: "identity-document-types" do 
    get "delete"
  end
  
  get "transfers/show/:uid" => "transfers#show",as: :show_transfer

  get "transfers/download/:uid" => "transfers#download",as: :download_slip

  resources :transfers do 
    get "delete"
  end

  resources :currencies do 
    get "delete"
  end

  #root to: "front#home"
   get "/dashboard" => "dashboard#index", as: :dashboard

  get 'histories/transfers' => 'search#search_transfers', as: :history_transfers 
  get 'histories/withdrawals' => 'search#search_withdrawals', as: :history_withdrawals

  get 'search/transfers' => 'transfers#search', as: :search_transfers 
  

  get "/accounts"     => "custom_accounts#index", as: :all_accounts 
  post "/accounts/new"     => "custom_accounts#create", as: :create_account
  get "/accounts/new"     => "custom_accounts#new", as: :new_account
  get "/account/edit/:uid" => "custom_accounts#edit", as: :edit_account
  patch "/account/update/:uid" => "custom_accounts#update", as: :udapte_account
  get "/account/update/:uid" => "custom_accounts#update", as: :update_account
  delete "/account/destroy/:uid" => "custom_accounts#destroy", as: :destroy_account
  get "/account/delete/:uid" => "custom_accounts#delete", as: :delete_account
  get "/companies/:uid" => "companies#show", as: :show_company
 
  
 
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
