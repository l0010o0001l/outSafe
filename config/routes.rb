Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: {
    :registrations => :registrations,
    :omniauth_callbacks => "callbacks"
  }

  resources :parties

  as :user do
    get 'profile' => 'profile#show'
    get 'profile/edit', :to => 'profile#edit'
    put 'profile', :to => 'profile#update'
    get 'sign_out' => 'devise/sessions#destroy'
  end
end
