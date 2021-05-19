Rails.application.routes.draw do
  root to: 'users#home' 
  resources :users do
    resources :posts do
      resources :comments 
    end
  end
  resources :posts do
    resources :comments
  end
    

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
