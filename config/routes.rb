Rails.application.routes.draw do
  resources :students
  resources :lecturers do
    resources :courses
  end
  resources :enrollments

  get '/', to: "application#home"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:anything', to: "application#wrong_page"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# darlene@example.net