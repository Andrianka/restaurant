Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'

  get 'home' => 'pages#home', as: 'home'
  get 'contact' => 'pages#contact', as: 'contact'
  get 'about' => 'pages#about', as: 'about'
  get 'carts/show'
  get 'menu/' => 'products#menu', as: "menu"
  get 'profile' => 'users#profile', as: "profile"
  put 'upload_avatar' => 'users#upload_avatar', as: 'upload_avatar'
  resources :products, except: [:edit, :index]
  resources :categories, except: [:edit]
  put 'update_status/:id' => 'orders#update_status', as: 'update_status'
  resources :orders, except: [:destroy, :edit] do
    member do
      get 'my_order' => 'orders#user_order', as: 'user'
      get 'order_items' => 'orders#client_order', as: 'show_client'
      get 'all_orders_client' => 'orders#all_client_orders', as: 'all_client'
    end
  end
  resources :order_items, only: [:create, :update, :destroy]
  resources :reservations, except: [:edit] do
    member do
      put 'reservation_declined' => 'reservations#change_status_declined', as: 'declined'
    end
  end
  resources :tables, except: [:edit]
  resources :users, except: [:edit]
  resource :cart, only: [:show]

end
