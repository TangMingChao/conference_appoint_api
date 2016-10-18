Rails.application.routes.draw do
  resources :meeting_room_infos ,only: [:show,:index]
  devise_for :administrators
  namespace :admin do
  	resources :orders ,only: [:show,:index] do
      member do
        post :accept
        post :refuse
      end

  	end
  end
  resources :orders,only: [:create, :index, :show] 
  resources :meeting_rooms ,only: [:show,:index]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
