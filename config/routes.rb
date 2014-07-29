Rails.application.routes.draw do

  resources :pins

  devise_for :users
  root "site#home"
  get "about" => "site#about"

end
