Rails.application.routes.draw do


	resources :users
	resources :sessions, :except => :destroy
	delete :sessions, :to => "sessions#destroy"
	resources :statuses
	resources :likes
	root to: "welcome#index"
end
