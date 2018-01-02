Rails.application.routes.draw do

  devise_for :users

  authenticate :user do
    resources :users
    resources :endorsements
    resources :notes do
      collection do
        get 'import/new', to: 'notes#new_import' # import_new_notes_path
        post 'import/new', to: 'notes#import' # import_notes_path
      end
    end
  end

  root 'home#index'

end
