Rails.application.routes.draw do
  resources :students
  resources :lecturers do
    resources :courses, only: [:new, :show, :create, :edit, :update, :destroy]
  end
  resources :courses, only: [:index]
  get '/courses/ordered_by_lecturer', to: 'courses#ordered_by_lecturer'
  resources :enrollments

  get '/', to: "application#home"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#google', via: [:get, :post] 
  get '/:anything', to: "application#wrong_page"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
