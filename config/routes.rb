Rails.application.routes.draw do
  namespace :api do

    resources :users, only: [:create, :index, :show]

    resource :profile, only: [:show, :update]

    resource :session, only: [:create, :destroy]

    resources :chats, only: [:create, :index, :show] do
      resources :messages
      # get 'mark_as_read', on: :member
      resource :mark_as_read, only: [:show]
    end
  end
end
