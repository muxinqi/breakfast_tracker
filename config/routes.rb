Rails.application.routes.draw do
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [ :new, :create ] do
    member do
      patch :increase_egg_count
      patch :decrease_egg_count
      patch :increase_corn_count
      patch :decrease_corn_count
      patch :increase_sweet_potato_count
      patch :decrease_sweet_potato_count
      get :food_consumption
    end
  end

  resources :cooking_records, only: [ :create ] do
    member do
      patch :finish
    end
  end

  get "changelog" => "home#changelog"
  get "food_consumption" => "home#food_consumption"

  # http://localhost:3000/analytics
  mount ActiveAnalytics::Engine => "analytics"
end
