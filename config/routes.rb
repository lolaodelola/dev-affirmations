Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'affirmations#new'
  resources :affirmations
  resources :developers, param: :uuid, defaults: { format: 'xml' } do
    patch '/confirm', to: 'developers#confirm'
    get '/confirm', to: 'developers#preconfirm', as: 'preconfirm'
  end
  post '/twilio/receive', to: 'developers#receive'
end