Rails.application.routes.draw do
  get 'welcome/index' 
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'triangle/', to: 'triangle#new'
  post 'triangle/', to: 'triangle#create'
  resources :posts do
    resources :comments
  end
end
