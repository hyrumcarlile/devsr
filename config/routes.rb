Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :achievements
    resources :achievement_criteria
    resources :endorsements
    resources :notes
    resources :simulated_days
    resources :skills
    resources :skill_ratings
    resources :votes

    root to: 'users#index'
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do
    resources :users, except: [:show]
    resources :endorsements
    resources :relationships, only: [:create, :destroy]
    resources :skills
    resources :achievements do
      get 'grant'
    end
    resources :votes, only: [:destroy]
    resources :notes, except: [:show] do
      post 'upvote'
    end

    # After sign-up form
    get 'new-user/:id', to: 'users#new_user', as: :new_user_form

    # For the html importer
    get 'import/new', to: 'notes#new_import' # import_new_notes_path
    post 'import/new', to: 'notes#import' # import_notes_path

  end

  resources :notes, only: [:show]
  resources :users, only: [:show]

  authenticated :user do
    root 'users#current_user_home', as: :authenticated_root
  end

  root 'home#index'

end
