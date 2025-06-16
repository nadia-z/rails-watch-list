Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "lists#index"

  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:create]
  end

  delete "bookmarks/:id", to: "bookmarks#destroy"
end
