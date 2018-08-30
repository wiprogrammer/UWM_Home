Rails.application.routes.draw do
  resources :user_home_settings do
    collection do
      patch :sort
      patch :shown
    end
  end

  resources :home_widgets
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
