Rails.application.routes.draw do

  get "papers/question/:id" => "papers#start_test", as: :start_test
  get "papers/ques/:id" => "papers#test", as: :test
  post "papers/ques/:id" => "papers#submit"
  root "papers#index" 
  devise_for :users, controllers: { 
  	sessions: 'users/sessions',
  	confirmations: 'users/confirmations',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations' 
  }
  resources :users, only: [:show,:index]
 
  resources :papers do
  	resources :questions do
  		resources :options
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
