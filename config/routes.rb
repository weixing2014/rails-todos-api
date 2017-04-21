Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'sign_up' => 'users#create'
      resources :todos do
        resources :items
      end
    end
  end
end
