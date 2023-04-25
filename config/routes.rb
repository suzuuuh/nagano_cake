Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'cart_items/index'
    get 'cart_items/new'
    get 'cart_items/create'
    get 'cart_items/show'
    get 'cart_items/edit'
    get 'cart_items/update'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/all_destroy'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirm'
    get 'customers/withdraw'
  end
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
    get "customers/my_page/edit" => "customers#edit"
    get "customers/my_page" => "customers#show"
    patch "customers/my_page" => "customers#update"
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
