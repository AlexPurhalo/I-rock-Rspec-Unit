Rails.application.routes.draw do
  resources :achievements
  root 'welcome#index'
end
