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
    root to: "posts#index"
    
    get "/login", to: "sessions#new", as: :session_new
    post "/login", to: "sessions#create", as: false

    get "/posts", to: "posts#index", as: :posts
    get "/post/new", to: "posts#new", as: :post_new
    post "/post/new", to: "posts#create", as: false
    get "/post/:id", to: "posts#show", as: :post
    get "/post/:id/edit", to: "posts#edit", as: :post_edit
    put "/post/:id/edit", to: "posts#update", as: false
    get "/post/:id/delete", to: "posts#delete", as: :post_delete
    delete "/post/:id/delete", to: "posts#destroy", as: :post_destroy

    get "/categories", to: "categories#index", as: :categories
    get "/category/new", to: "categories#new", as: :category_new
    post "/category/new", to: "categories#create", as: false
    
  end
end
