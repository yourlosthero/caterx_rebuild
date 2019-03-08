Rails.application.routes.draw do
  
	root 'beta#home'

	get 'search' => 'beta#results', as:'search'

	get 'login' => 'beta#login', as:'login'

	get 'register' => 'beta#register', as:'register'

	post 'login' => 'beta#login_submit', as:'login_submit'

	match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]
    match 'signout', to: 'sessions#signout', as: 'signout', via: [:get, :post]

	resources :packages
	resources :customers
	resources :caterers
end
