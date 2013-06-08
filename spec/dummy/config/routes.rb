Dummy::Application.routes.draw do
  resources :recipes, only: :create
end
