Wingman::Engine.routes.draw do
  post '/' => 'feedback#create', :as => :send_feedback
  root :to => 'feedback#index'
end
