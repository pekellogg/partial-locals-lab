Rails.application.routes.draw do
  resources :classrooms, only: :show
  resources :students, except: :delete
end
