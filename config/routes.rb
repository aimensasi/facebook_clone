Rails.application.routes.draw do


	resources :users
	resources :sessions, :except => :destroy
	post :sessions, :to => "sessions#create"
	delete :sessions, :to => "sessions#destroy", :as => "signout"
	resources :statuses
	resources :likes
	root to: "welcome#index"
end
