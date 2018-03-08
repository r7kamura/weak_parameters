Dummy::Application.routes.draw do
  resources :recipes, only: :create
  resources :strongs, only: :create
  resources :global_strongs, only: :create

  scope :api do
    resources :recipes, only: :create
    resources :strongs, only: :create
    resources :global_strongs, only: :create
  end
end
