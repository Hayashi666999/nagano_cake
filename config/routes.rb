Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "public/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get '' => 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

  namespace :public do
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all',as:'cart_items_destroy_all'
    resources :items
    resources :genres
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe_confirm' => 'customers#unsubscribe_confirm'
    patch '/customers/unsubscribe' => 'customers#unsubscribe'
    resources :cart_items
    resources :addresses
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    get '/about' => 'homes#about'
    resources :orders

  end



end
