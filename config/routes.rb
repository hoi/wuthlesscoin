Wuthlesscoin::Application.routes.draw do
  devise_for :admins

  resources :coins

  root :to => "home#index"
end
