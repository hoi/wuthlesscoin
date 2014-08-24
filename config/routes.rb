Wuthlesscoin::Application.routes.draw do
  devise_for :admins

  resources :coins

  get "mash", :to => "home#mash"
  get "ips/:rpi_id/:mash", :to => "home#ips"

  root :to => "home#index"
end
