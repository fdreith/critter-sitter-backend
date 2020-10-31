Rails.application.routes.draw do
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
