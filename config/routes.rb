Rails.application.routes.draw do
  root "quotes#index"


  # constraints subdomain: 'api' do
    # scope module: 'api' do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :quotes
      end
    end
  # end
end
