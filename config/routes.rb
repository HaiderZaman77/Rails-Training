Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
}
  root to: 'posts#index' 
  resources :users do
    resources :posts do
      resources :comments 
    end
  end
  resources :posts do
    resources :comments
  end

end
