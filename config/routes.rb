Rails.application.routes.draw do

  devise_for :users

  authenticate :user do
    resources :users
    resources :endorsements
    resources :notes

    get 'notes/import/new', to: 'notes#new_import' # import_new_notes_path
    post 'notes/import/new', to: 'notes#import' # import_notes_path
  end

  root 'home#index'

end
