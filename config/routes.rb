Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "lists/new", to: "lists#new", as: :new_list

  # As a user, I can see all my movie lists
  get "lists", to: "lists#index", as: :lists
  # As a user, I can create a movie list
  post "lists", to: "lists#create"
  # As a user, I can see the details of a movie list
  get "lists/:id", to: "lists#show", as: :list
  # As a user, I can bookmark a movie inside a movie list
  # get "lists/:id/bookmarks/new", to: "bookmarks#new", as: :new_bookmark
  post "lists/:id/bookmarks", to: "bookmarks#create", as: :list_bookmarks
  # As a user, I can destroy a bookmark
  delete "bookmarks/:id", to: "bookmarks#destroy"


end
