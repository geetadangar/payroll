Rails.application.routes.draw do
  root 'imports#index'
  resources :salaries
  resources :imports
  post "/export(/:id)", to: "imports#export", as: :export
  post "/send_email(/:id)", to: "employees#send_email", as: :send_email
  resources :companies do
    resources :employees
  end
end