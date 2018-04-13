Rails.application.routes.draw do
  resources :achievements
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do
    resources :users
    resources :endorsements
    resources :skills
    resources :achievements
    resources :votes, only: [:destroy]
    resources :notes do
      post 'upvote'
    end

    # For the html importer
    get 'import/new', to: 'notes#new_import' # import_new_notes_path
    post 'import/new', to: 'notes#import' # import_notes_path

  end

  authenticated :user do
    root 'users#current_user_home', as: :authenticated_root
  end

  root 'home#index'

end
