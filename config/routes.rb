Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: "homes#top"
    get 'about'=>'homes#about'
    resources :items, only: [:index, :show]
    resources :sessions, only: [:create, :new, :destroy]
    get "customers/edit" => "customers#edit"
    get "customers/my_page" => "customers#show"
    get "customers" => "customers#update"
    get "customers/confirm" => "customers#confirm"
    get "customers/withdraw" => "customers#withdraw"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get "cart_items/all_destroy" => "cart_items#all_destroy"
    resources :orders, only: [:new, :create, :index, :show]
    get "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"

  end

  namespace :admin do
    root to: "homes#top"
    resources :cart_items, only: [:index, :show, :edit, :update, :new, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]

  end




end
