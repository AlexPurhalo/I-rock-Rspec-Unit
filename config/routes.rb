Rails.application.routes.draw do
  resources :achievements, only: [:new, :create, :show ]
  root 'welcome#index'
end
