Rails.application.routes.draw do
  resources :courses
  resources :students
  resources :lecturers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
