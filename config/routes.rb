Rails.application.routes.draw do
  root 				to: "welcome#index"
  
  get "help", 		to: "welcome#help"
  get "othergems", 	to: "welcome#othergems"

  resources :welcome, only: [:index, :help, :othergems]

  resources :posts, only: [:index, :show, :new, :create]
end

# From a rails routes:
#  					 Prefix Verb   URI Pattern                  Controller#Action
# 					   root GET    /                            welcome#index
#                 othergems GET    /othergems(.:format)			welcome#othergems
#             welcome_index GET    /welcome(.:format)           welcome#index
#             		   help GET    /help(.:format)              welcome#help

#                     posts GET    /posts(.:format)             posts#index
#                           POST   /posts(.:format)             posts#create
#                  new_post GET    /posts/new(.:format)         posts#new
#                      post GET    /posts/:id(.:format)         posts#show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html