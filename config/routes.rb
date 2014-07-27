Rails.application.routes.draw do

  devise_for :users
  root "site#home"
  get "about" => "site#about"

end
