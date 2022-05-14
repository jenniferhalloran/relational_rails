Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/farmers_markets', to: 'farmers_markets#index'
  get '/farmers_markets/new', to: 'farmers_markets#new'
  get '/farmers_markets/:id', to: 'farmers_markets#show'
  get '/stands', to: 'stands#index'
  get '/stands/:id', to: 'stands#show'
  get '/farmers_markets/:id/stands', to: 'farmers_market_stands#index'
  post '/farmers_markets', to: 'farmers_markets#create'
end
