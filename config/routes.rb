Rails.application.routes.draw do
  get 'dashboard/show'
  root to: 'dashboard#show'
end
