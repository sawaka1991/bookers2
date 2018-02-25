Rails.application.routes.draw do

  get 'books/about' => 'books#about'



	devise_for :users 
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :books, except: [:new]
	resources :users, only: [:show, :edit, :update, :index]
	root 'books#top'

end
