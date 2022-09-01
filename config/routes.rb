Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  match '/send_email', to: 'welcome#send_email', via: 'post'
end
