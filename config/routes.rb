EarthquakeAPI::Application.routes.draw do

  resources :earthquakes, :only => [:index]

  root :to => 'earthquakes#index'
end
