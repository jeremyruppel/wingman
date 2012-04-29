Wingman::Engine.routes.draw do
  resources :feedback, :only => [ :index, :create ], :path => ''
  root      :to => 'feedback#index'
end
