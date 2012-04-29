require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
  autoload :Config, 'wingman/config'

  class << self
    def configure
      yield self
    end
  end

  include Config
end

require 'wingman/engine' if defined?(Rails)
