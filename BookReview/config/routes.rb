Rails.application.routes.draw do
 

  devise_for :users 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmls
	resources :books do
		resources :reviews
		resources :posts
	end

	resources :users do
		resources :profiles
		resources :books
	end	



	root "users#show"
end
