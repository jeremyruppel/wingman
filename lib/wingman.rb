require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
end

require 'wingman/engine' if defined?(Rails)
