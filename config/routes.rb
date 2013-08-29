HelloWorld::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root :to => "welcome#index"
  get "/sobre", to: "welcome#about", as: :about
  get "/inscricoes", to: "welcome#inscription", as: :inscription
  get "/parceiros", to: "welcome#partners", as: :partners
  get "/contato", to: "welcome#contact", as: :contact
  get "/contato", to: "welcome#contact",  as: :contact
  

  namespace :blog do
    root to: "home#index"
    get "/post/:id", to: "posts#show", as: :post    
  end

  namespace :admin do
    root to: "home#index"

    get "/login", to: "sessions#new", as: :login
    post "/login", to: "sessions#create", as: false
    delete "/logout", to: "sessions#destroy", as: :logout

    get "/posts", to: "posts#index", as: :posts

    get "/post/new", to: "posts#new", as: :new_post
    post "/post/new", to: "posts#create", as: false

    get "/post/:id", to: "posts#show", as: :post

    get "/post/:id/edit", to: "posts#edit", as: :edit_post
    put "/post/:id/edit", to: "posts#update", as: false

    get "/post/:id/delete", to: "posts#delete", as: :delete_post
    delete "/post/:id/destroy", to: "posts#destroy", as: :destroy_post

    get "/categories", to: "categories#index", as: :categories

    get "/category/new", to: "categories#new", as: :new_category
    post "/category/new", to: "categories#create", as: false

    get "/category/:id/edit", to: "categories#edit", as: :edit_category
    put "/category/:id/edit", to: "categories#update", as: false

    get "/users", to: "users#index", as: :users

    get "/user/new", to: "users#new", as: :new_user
    post "/user/new", to: "users#create", as: false

    get "/medias", to: "medias#index", as: :medias

  end
end
