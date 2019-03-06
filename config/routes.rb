Rails.application.routes.draw do
  resource :users, only: [:new, :create]
  get 'users/edit/:id', to: 'users#edit'
  patch 'users/:id', to: 'users#update', as: :edit_user
end
