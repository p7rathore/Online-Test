Rails.application.routes.draw do
  devise_for :users, controllers: { 
  	registrations: 'users/registrations' ,
    sessions: 'users/sessions' 
  }
  authenticated :user, ->(u) { u.admin } do #admin
    root "admin/papers#index"
    namespace :admin do
      root "papers#index" 
      resources :papers
      resources :users, only: [:show,:index] do
        member do
          get "result" => "users#result", as: :result
        end
      end
    end
  end
  authenticated :user, ->(u) { !u.admin } do #user
      root "papers#index"
      resources :papers, except:[:show] do
        member do
          get "instructions" => "papers#show", as: :start
          get "/" => "papers#test", as: :test
          get "submit_test" => "papers#submit_test", as: :submit_test
          get "Result" => "papers#result", as: :result
          post "/" => "papers#submit"
        end  
      
    end
    resources :users, only:[:show]  
  end
  root "papers#index"
  get "/*args"=>"users#undef"
end
