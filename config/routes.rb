Rails.application.routes.draw do

  root "site#home"
  get "about" => "site#about"

end
