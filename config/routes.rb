Rails.application.routes.draw do

  root 'pages#index'


  resources :users

  patch 'users/:id/edit' => 'users#update'
  #               PATCH  /users/:id(.:format)                   users#update
  delete 'users/:id' =>   'users#destroy', as: :destroy_user
  # destroy_user  DELETE /users/:id(.:format)                   users#destroy
  # post 'users/:id/add_card/:card_id' => 'users#add_card', as: :user_add_card
  # user_add_card POST   /users/:id/add_card/:card_id(.:format) users#add_card
  get 'users/:id/user_cards' => 'users#cards', as: :user_cards
  #    user_cards GET    /users/:id/user_cards(.:format)        users#cards
  #         users GET    /users(.:format)                       users#index
  #               POST   /users(.:format)                       users#create
  #     new_user  GET    /users/new(.:format)                   users#new
  #     edit_user GET    /users/:id/edit(.:format)              users#edit
  #          user GET    /users/:id(.:format)                   users#show
  #               PUT    /users/:id(.:format)                   users#update
  #               DELETE /users/:id(.:format)                   users#destroy
  #               PATCH  /users/:id/edit(.:format)              users#update


  resources :cards
  get '/cards/:id/add' => 'cards#add', as: :add_card
  delete 'cards/:id' =>   'cards#destroy', as: :destroy_card
#   destroy_card DELETE /cards/:id(.:format)                   cards#destroy
#          cards GET    /cards(.:format)                       cards#index
#    users_cards GET    /users/cards(.:format)                 cards#index
#  user_add_card POST   /users/:id/add_card/:card_id(.:format) users#add_card
#     user_cards GET    /users/:id/user_cards(.:format)        users#cards

#                POST   /cards(.:format)                       cards#create
#       new_card GET    /cards/new(.:format)                   cards#new
#      edit_card GET    /cards/:id/edit(.:format)              cards#edit
#           card GET    /cards/:id(.:format)                   cards#show
#                PATCH  /cards/:id(.:format)                   cards#update
#                PUT    /cards/:id(.:format)                   cards#update
#                DELETE /cards/:id(.:format)                   cards#destroy

  resources :pages
        #     pages GET    /pages(.:format)                       pages#index
        #           POST   /pages(.:format)                       pages#create
        #  new_page GET    /pages/new(.:format)                   pages#new
        # edit_page GET    /pages/:id/edit(.:format)              pages#edit
        #      page GET    /pages/:id(.:format)                   pages#show
        #           PATCH  /pages/:id(.:format)                   pages#update
        #           PUT    /pages/:id(.:format)                   pages#update
        #           DELETE /pages/:id(.:format)                   pages#destroy

  delete '/logout' => 'sessions#destroy', as: :logout
        #     logout DELETE /logout(.:format)                  sessions#destroy
        #   sessions POST   /sessions(.:format)                 sessions#create
        #new_session GET    /sessions/new(.:format)                sessions#new
  resources :sessions, only: [:new, :create]

end
