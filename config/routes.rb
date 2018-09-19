Rails.application.routes.draw do
  root to: "welcome#index"
  
  get "help", to: "welcome#help"
  get "othergems", to: "welcome#othergems"
  resources :welcome, only: [:index, :help, :othergems]

  resources :posts
end

# From a rake routes:
#  					 Prefix Verb   URI Pattern                                                                              Controller#Action
# 					   root GET    /                                                                                        welcome#index
#                 othergems GET    /othergems(.:format)                                                                     welcome#othergems
#             welcome_index GET    /welcome(.:format)                                                                       welcome#othergems
#             		   help GET    /help(.:format)                                                                      welcome#index

#                     posts GET    /posts(.:format)                                                                         posts#index
#                           POST   /posts(.:format)                                                                         posts#create
#                  new_post GET    /posts/new(.:format)                                                                     posts#new
#                 edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html