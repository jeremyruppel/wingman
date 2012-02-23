require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
  autoload :Config, 'wingman/config'
  autoload :Tests,  'wingman/tests'

  include Config
  include Tests

  def self.configure
    yield self
  end
end

require 'wingman/engine' if defined?(Rails)
