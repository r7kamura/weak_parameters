Dummy::Application.routes.draw do
  resources :recipes,       only: :create
  resources :strongs,       only: :create
  resources :multi_actions, only: %i(index create)
end
