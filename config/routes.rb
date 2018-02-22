Rails.application.routes.draw do

  get 'books/about' => 'books#about'
  get 'books/home'


	devise_for :users 
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :books
	resources :users, only: [:show, :edit, :update, :index]
	root 'books#top'

end
