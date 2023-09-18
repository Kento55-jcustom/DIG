Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'ibanes/:ibane_id/likes' => 'likes#create'
  get 'ibanes/:ibane_id/likes/:id' => 'likes#destroy'
  resources :ibanes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'ibanes#index'
end