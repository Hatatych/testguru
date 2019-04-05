Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_up: :register, sign_out: :logout }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
