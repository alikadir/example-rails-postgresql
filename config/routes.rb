Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  root "health#welcome"

  namespace :api do
    resources :products
  end

  scope "new-api" do
    scope :v3 do
      resources :dummy
    end
  end

end
