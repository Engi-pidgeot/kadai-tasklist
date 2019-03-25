Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  
  resources :tasks
#    tasks GET    /tasks(.:format)          tasks#index
#          POST   /tasks(.:format)          tasks#create
# new_task GET    /tasks/new(.:format)      tasks#new
#edit_task GET    /tasks/:id/edit(.:format) tasks#edit
#     task GET    /tasks/:id(.:format)      tasks#show
#          PATCH  /tasks/:id(.:format)      tasks#update
#          PUT    /tasks/:id(.:format)      tasks#update
#          DELETE /tasks/:id(.:format)      tasks#destroy
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create]
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
