Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get 'catalog/:catalog_id/products/' => 'products#menu', as: "menu"

  resources :products, except: [:edit, :index]
  resources :categories, except: [:edit]
  resources :orders, except: [:destroy, :edit]
  resources :reservations, except: [:edit]
  resources :tables, except: [:edit]
  resources :users, only: [:index, :show]

end
