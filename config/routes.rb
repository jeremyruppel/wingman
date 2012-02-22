Wingman::Engine.routes.draw do

  get '/status' => 'status#status'

  root :to => 'status#index'
end
