Rails.application.routes.draw do
  resources :courses, only [:index, :show]
  resources :students
  resources :lecturers do
    resources :courses, only: [:new, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
