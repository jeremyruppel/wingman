Wingman::Engine.routes.draw do
  post '/' => 'feedback#create'
  root :to => 'feedback#index'
end
