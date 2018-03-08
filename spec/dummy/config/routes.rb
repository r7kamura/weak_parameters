Dummy::Application.routes.draw do
  resources :recipes, only: :create
  resources :strongs, only: :create

  scope :api do
    resources :recipes, only: :create
    resources :strongs, only: :create
    post '/strongs/blocks', to: 'api/strongs#create_block_strong'
  end
end
