Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my'
  resources :users
  resources :events

  post 'attendee', to: 'attendees#create'

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
