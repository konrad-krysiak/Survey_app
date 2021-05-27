Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root "main#index"

	get '/:public_url', to: 'answers#public_answer'
	resources :main
	resources :surveys do
		resources :questions
		resources :answers
	end
end
