Rails.application.routes.draw do
  resources :jobs
  root to: 'jobs#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
