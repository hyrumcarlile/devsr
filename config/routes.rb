Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do
    resources :users
    resources :endorsements
    resources :skills
    resources :notes do
      get 'import/new', to: 'notes#new_import' # import_new_notes_path
      post 'import/new', to: 'notes#import' # import_notes_path
      post 'upvote'
    end
    resources :votes, only: [:destroy]
  end

  root 'home#index'

end
