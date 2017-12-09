Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    resources :users
  end
  root 'home#index'
end
