Rails.application.routes.draw do
  root to: 'projects#home'

  resources :projects, except: [:index]
end
