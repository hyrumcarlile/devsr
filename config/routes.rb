Rails.application.routes.draw do
  resources :endorsements
  devise_for :users
  authenticate :user do
    resources :users
  end
  root 'home#index'
end
