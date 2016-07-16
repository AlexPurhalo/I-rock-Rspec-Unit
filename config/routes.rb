Rails.application.routes.draw do
  devise_for :users
  resources :achievements
  root 'welcome#index'
end
