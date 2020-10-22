Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  resources :pictureshots do 
    
    resources :comments

  end
   devise_for :users, controllers: { 

    sessions: 'users/sessions',

    registrations: 'registrations' }


 #  devise_for :users, controllers:
 # { sessions: 'users/sessions',
 #   registrations: 'users/registrations',
 #   passwords: 'users/passwords',
 #   unlocks: 'users/unlocks',
 #   confirmations: 'users/confirmations' }
  root "pictureshots#index"
end
