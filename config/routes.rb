Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :v1, contraints: ApiVersion.new('v1', true) do
    post 'signup' => 'authentication#signup'
    post 'login' => 'authentication#login'
    resources :todos do
      resources :items
    end
  end
end
