Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :route, only: [:index, :show] do
        collection do
          get 'status'
          post 'calc'
        end
      end
    end
  end
end
