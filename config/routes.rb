Rails.application.routes.draw do

  get "users/results" => "admin/papers#user", as: :users
  get "user/:id/result" => "admin/papers#user_result", as: :user_result
  get "papers/:id/instructions" => "papers#start_test", as: :start_test  
  get "papers/:id" => "papers#test", as: :test
  get "papers/:id/submit_test" => "papers#submit_test", as: :submit_test
  get "paper/:id/Result" => "papers#result", as: :result
  post "papers/ques/:id" => "papers#submit"
  
  
  devise_for :users, controllers: { 
  	registrations: 'users/registrations' ,
    sessions: 'users/sessions' 
  }
  
  resources :users, only: [:show,:index]
 
  authenticated :user, ->(u) { u.admin } do
    root "admin/papers#index" 
  end
  root "papers#index"

  get "admin/paper/:id" => "admin/papers#show", as: :show
  
  namespace :admin do
    resources :papers
  end
 
  resources :papers   
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
