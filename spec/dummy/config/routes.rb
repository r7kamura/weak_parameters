Dummy::Application.routes.draw do
  resources :recipes, only: :create
  resources :strongs, only: :create

  scope :api do
    resources :recipes, only: :create
    resources :strongs, only: :create
  end
end
