Spree::Core::Engine.routes.draw do
  namespace :admin, path: Spree.admin_path do
    resources :products do
      resources :digitals
    end

    resources :orders do
      member do
        get :reset_digitals
      end
    end
  end

  get '/digital/:secret', to: 'digitals#show', as: 'digital', constraints: { secret: /[a-zA-Z0-9]{30}/ }
end
