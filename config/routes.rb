Rails.application.routes.draw do
  resources :books
  resources :genres
  resources :finished_books
end
