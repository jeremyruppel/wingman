require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
  autoload :Config, 'wingman/config'

  extend Config

  def self.configure
    yield self
  end
end

require 'wingman/engine' if defined?(Rails)
