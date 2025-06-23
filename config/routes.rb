Rails.application.routes.draw do
  root "learning_concepts#index"

  resources :learning_concepts, only: [:index, :show] do
    post :generate_story, on: :collection
  end
end
