Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin, skip: :all
  devise_scope :admin do
    get 'admin/sign_up' => 'devise/registrations#new'
    post 'admin' => 'devise/registrations#create'
    get 'admin/sign_in' => 'admin/devise/sessions#new'
    post 'admin/sign_in' => 'admin/devise/sessions#create'
    delete 'admin/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :end_users, skip: :all
  devise_scope :end_user do
    get 'end_users/sign_up' => 'public/devise/registrations#new'
    post 'end_users' => 'public/devise/registrations#create'
    get 'end_users/sign_in' => 'public/devise/sessions#new'
    post 'end_users/sign_in' => 'public/devise/sessions#create'
    delete 'end_users/sign_out' => 'public/devise/sessions#destroy'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    get 'items/top' => 'items#top'
    root 'end_users#top'
  	resource :end_users, only: [:show, :edit, :update, :destroy]
    get 'end_users/withdrow' => 'end_users#withdrow'
    get 'end_users/swich' => 'end_users#swich'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'cart_items/withdrow' => 'cart_items#withdrow'
    post 'orders/verification' => 'orders#verification'
    get 'orders/completed' => 'orders#completed'
    resources :orders, only: [:index, :new, :show, :create]
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  end

  namespace :admin do
  	get 'top' => 'homes#top', as: "top"
    resources :end_users, only: [:index, :show, :update, :edit]
    resources :genres, only: [:index, :create, :update, :edit]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
end
