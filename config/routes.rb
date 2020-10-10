Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'affirmations#new'
  resources :affirmations
  resources :developers, param: :uuid do
    post '/confirm', to: 'affirmations#confirm', as: 'confirm'
  end
end