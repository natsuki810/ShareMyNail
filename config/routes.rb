Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get '/top' => 'homes#top', as: 'top'
  resources :designs, only: [:index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get '/users/:id/comments' => 'users#comments'
  get '/users/:id/designs' => 'users#designs', as: "users_designs"
  resources :colors, only: [:new, :index, :create, :destroy]
  resources :comments, only: [:index, :destroy]
  resources :reports, only: [:index, :update]
end

scope module: :public do
  root to: 'homes#top'
  get '/homes/about' => 'homes#about', as: 'about'
  get '/users/mypage' => 'users#show'
  get '/users/mypage/edit' => 'users#edit'
  patch '/users/mypage/edit' => 'users#update'
  get '/users/comments' => 'users#comments'
  get '/users/:id/designs' => 'users#designs', as: "users_designs"
  get '/users/:user_id/favorites' => 'favorites#index', as: 'favorites'
  get '/users/confirm' => 'users#confirm'
  patch 'users/withdrawal' => 'users#withdrawal'
  resources :designs, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :reports, only: [:new, :create]
  namespace :comments do
    resources :reply, only: [:create, :update, :destroy]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
