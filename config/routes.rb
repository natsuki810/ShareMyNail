Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get "/top" => "homes#top", as: "top"
    resources :designs, only: [:index, :show, :edit, :update, :destroy]
    delete "designs/:id/design_destroy" => "designs#design_destroy", as: "design_destroy"
    resources :comments, only: [:index, :destroy] do
      resources :replies, only: [:index, :destroy]
    end
    delete "replies/:id/replies_destroy" => "replies#replies_destroy", as: "replies_destroy"
    delete "replies/:id/reports_replies_destroy" => "replies#reports_replies_destroy", as: "reports_replies_destroy"
    delete "comments/:id/comment_destroy" => "comments#comment_destroy", as: "comments_destroy"
    delete "comments/:id/reports_comments_destroy" => "comments#reports_comments_destroy", as: "reports_comments_destroy"
    resources :reports, only: [:index, :show, :update]
    resources :users, only: [:index, :show, :edit, :update]
    get "/users/:id/comments" => "users#comments"
    get "/users/:id/designs" => "users#designs", as: "users_designs"
    resources :colors, only: [:new, :index, :create, :destroy]
  end

  scope module: :public do
    root to: "homes#top"
    get "/homes/about" => "homes#about", as: "about"
    get "/users/mypage/edit" => "users#edit"
    patch "/users/mypage/edit" => "users#update"
    get "/users/mypage/:id" => "users#show", as: "users_mypage"
    get "/users/comments" => "users#comments"
    get "/users/:id/designs" => "users#designs", as: "users_designs"
    get "/users/:user_id/favorites" => "favorites#index", as: "favorites"
    get "/users/confirm" => "users#confirm"
    patch "users/withdrawal" => "users#withdrawal"
    delete "designs/:design_id/replies/:id" => "comments#reply#destroy", as: "design_reply"
    resources :designs, only: [:index, :edit, :update, :destroy, :new, :create] do
    resources :reports, only: [:new, :create]
    resources :comments, only: [:destroy]
    resource :favorites, only: [:create, :destroy]
  end
    resources :comments, only: [] do
      resources :replies, only: [:create, :update, :destroy]
    end

    get "designs/show/:id" => "designs#show", as: "designs_show"
    delete "designs/show/:id" => "comments#destroy", as: "design_comment_destroy"
    patch "designs/show/:id" => "comments#update", as: "design_comment_update"
    post "designs/show/:id" => "comments#create", as: "design_comments"

    patch "comments/:id/comments_update" => "comments#comments_update", as: "comments_update"
    delete "comments/:id/comments_destroy" => "comments#comments_destroy", as: "comments_destroy"
    patch "replies/:id/replies_update" => "replies#replies_update", as: "replies_update"
    delete "replies/:id/replies_destroy" => "replies#replies_destroy", as: "replies_destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
