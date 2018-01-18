Rails.application.routes.draw do

  get 'users/new'
  
	resources :users
	
	root 'static_pages#home'

	get '/home', to: 'static_pages#home'

	get '/help', to: 'static_pages#help'

	get '/about', to: 'static_pages#about'

	get '/teams', to: 'static_pages#teams'

	get '/meta', to: 'static_pages#meta'

	get '/leaderboards', to: 'static_pages#leaderboards'

	get '/members', to: 'users#index'

	get '/member_page', to: 'users#show'

	match '/auth/:provider/callback', to: 'sessions#create', via: :all
	
	delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
