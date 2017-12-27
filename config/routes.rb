Rails.application.routes.draw do

  devise_for :users

  authenticate :user do
    resources :users
    resources :notes
    resources :endorsements
  end

  root 'home#index'

end
