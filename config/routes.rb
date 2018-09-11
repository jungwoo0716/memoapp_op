Rails.application.routes.draw do

  root 'memos#index'
  
  devise_for :users
  resources :memos do
  resources :comments, only: [:create, :destroy]
  end
end