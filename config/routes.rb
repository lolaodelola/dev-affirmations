Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'affirmations#landing'
  resources :affirmations
  patch 'developers/:developer_uuid/confirm', to: 'developers#confirm', defaults: {format: "xml"}
  get 'developers/:developer_uuid/confirm', to: 'developers#preconfirm', as: 'preconfirm', defaults: {format: "xml"}
  post '/twilio/receive', to: 'developers#receive'
end