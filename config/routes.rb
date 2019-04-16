Rails.application.routes.draw do
  get 'feedback', to: 'feedbacks#new'
  post 'feedback', to: 'feedbacks#send_mail'
  get 'gists/index'
  root 'tests#index'
  get 'badges', to: 'user_badges#index'

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
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :tests, except: :show do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index
  end
end
