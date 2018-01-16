Rails.application.routes.draw do

  devise_for :users

  authenticate :user do
    resources :users
    resources :endorsements
    resources :notes
    resources :notes do
      collection do
        # post 'new', to: 'notes#new'
        # post ':id/edit', to: 'notes#edit'
        # delete ':id', to: 'notes#destroy'
        get 'import/new', to: 'notes#new_import' # import_new_notes_path
        post 'import/new', to: 'notes#import' # import_notes_path
      end
    end
  end

  root 'home#index'

end
