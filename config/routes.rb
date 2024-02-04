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
  resources :designs, only: [:index, :show, :edit, :update, :destroy, :new]
  resources :users, only: [:index, :comments, :show, :edit, :update]
  get '/users/:id/comments' => 'users#comments'
  get '/users/:id/designs' => 'users#designs'
  resources :colors, only: [:index, :create, :destroy]
  resources :comments, only: [:index, :destroy]
  resources :reports, only: [:index, :update]
end

scope module: :public do
  root to: 'homes#top'
  get '/home/about' => 'home#adout', as: 'about'
  get '/users/mypage' => 'users#show'
  get '/users/mypage/edit' => 'users#edit'
  patch '/users/mypage/edit' => 'users#update'
  get '/users/comments' => 'users#comments'
  get '/users/designs' => 'users#designs'
  get '/users/confirm' => 'users#confirm'
  patch 'users/withdrawal' => 'users#withdrawal'
  resources :designs, only: [:index, :edit, :update, :destroy, :new, :create]
  resources :comments, only: [:new, :create, :edit, :update]
  resources :reports, only: [:new, :create]
  resources :favorites, only: [:create, :index, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
