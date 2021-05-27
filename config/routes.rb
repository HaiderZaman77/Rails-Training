Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
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
