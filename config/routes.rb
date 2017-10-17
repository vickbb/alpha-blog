Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'paginas#home'
 	get 'sobre', to: 'paginas#sobre'

 	resources :artigos

 	get 'signup', to: 'usuarios#new'
 	post 'usuarios', to: 'usuarios#create'

 	#ou resourses :usuarios, except[:new]

end
