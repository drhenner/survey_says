Rails.application.routes.draw do
  namespace :survey_admin do
    resources :questions
  end
end
