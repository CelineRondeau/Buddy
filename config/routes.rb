Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  get '/welcome', to: 'pages#welcome', as: 'welcome'
  get '/buddy', to: 'pages#buddy', as: 'buddy'

  resources :events, except: [:edit, :update]
  get '/events/:id/delete', to: 'events#delete', as: 'delete_event'

  resources :requests, only: [:new, :create, :show, :update]
  get '/requests/:id/submitted', to: 'requests#submitted', as: 'submitted_request'
  get '/requests/incoming', to: 'requests#incoming', as: 'incoming_requests'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
