HelloWorld::Application.routes.draw do
  root :to => "welcome#index"
  get "/sobre",       :to => "welcome#about",       :as => :about
  get "/inscricoes",  :to => "welcome#inscription", :as => :inscription
  get "/contato",     :to => "welcome#contact",     :as => :contact
end
