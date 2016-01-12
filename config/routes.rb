Rails.application.routes.draw do
  get 'carts/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'home#index'

  get 'menu/' => 'products#menu', as: "menu"
  get 'profile' => 'users#profile', as: "profile"
  resources :products, except: [:edit, :index]
  resources :categories, except: [:edit]
  resources :orders, except: [:destroy, :edit]
  resources :order_items, only: [:create, :update, :destroy]
  resources :reservations, except: [:edit]
  resources :tables, except: [:edit]
  resources :users, except: [:edit]
  resource :cart, only: [:show]

end
