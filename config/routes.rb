Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#home'

  resources :projects, except: [:index]
end
