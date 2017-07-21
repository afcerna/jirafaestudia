Rails.application.routes.draw do
  resources :time_entries
  get 'welcome/index'

  root 'welcome#index'

  resources :pros
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
