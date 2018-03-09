Dummy::Application.routes.draw do
  resources :recipes, only: :create
  resources :strongs, only: :create

  scope :api do
    resources :recipes, only: :create
    resources :strongs, only: :create
    post '/strongs/per_validation_block_option', to: 'api/strongs#create_per_validation_block_option'
  end
end
