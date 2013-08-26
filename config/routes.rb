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
end
