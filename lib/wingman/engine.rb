require 'rails/engine'
require 'haml'
require 'compass-rails'

module Wingman
  class Engine < Rails::Engine
    isolate_namespace Wingman
  end
end
