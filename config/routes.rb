Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/new'
  # get 'lists/new'
  # get 'lists/show'
  # get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:new, :index, :show, :create] do
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # lists au pluriels
end
