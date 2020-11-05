Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/get_current_user'
  get 'sessions/destroy'
  scope '/api' do 
    resources :care_reminders
    resources :records
    resources :events
    resources :pets
    resources :user_households
    resources :households
    resources :users
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
