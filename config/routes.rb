Rails.application.routes.draw do
  namespace :admin do
    root "items#index"
    resources :items
    resources :categories, only: [:new, :create, :show, :index]
    resources :users, only: [:index, :show, :import_user] do
      collection do
        # API for sending POST request
        post "import_user"
      end
    end
  end
end