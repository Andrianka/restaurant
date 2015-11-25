Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  get 'menu/' => 'products#menu', as: "menu"

  resources :products, except: [:edit, :index]
  resources :categories, except: [:edit]
  resources :orders, except: [:destroy, :edit]
  resources :reservations, except: [:edit]
  resources :tables, except: [:edit]
  resources :users, only: [:index, :show]

end
