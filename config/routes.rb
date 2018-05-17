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

    root to: "users#index"
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do
    resources :users
    resources :endorsements
    resources :skills
    resources :achievements do
      get 'grant'
    end
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
