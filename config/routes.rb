Rails.application.routes.draw do
  root to: 'welcome#homepage'

  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'users#new'
end
