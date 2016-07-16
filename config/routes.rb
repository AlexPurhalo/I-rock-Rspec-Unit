Rails.application.routes.draw do
  resources :achievements, only: [:new, :create ]
  root 'welcome#index'
end
