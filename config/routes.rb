Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :result_data, only: :create
  end

  namespace :admin do
    resources :results
    resources :monthly_result_averages, only: [:index, :show, :delete]
    resources :daily_result_stats, only: [:index, :show, :delete]
  end

  root to: 'admin/results#index'
end
