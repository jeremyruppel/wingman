require 'rails/engine'
require 'haml'

module Wingman
  class Engine < Rails::Engine
    isolate_namespace Wingman

  end
end
