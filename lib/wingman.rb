require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
  autoload :Config, 'wingman/config'
  autoload :Tests,  'wingman/tests'

  class << self

    def reset!
      resets.each &:call
    end

    def resets
      @@resets ||= [ ]
    end

    def configure
      yield self
    end
  end

  include Config
  include Tests
end

require 'wingman/engine' if defined?(Rails)
