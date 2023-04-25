# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'articles/index'
  root "articles#index"
  resources :articles
end
