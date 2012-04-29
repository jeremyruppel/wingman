require 'wingman/version'

module Wingman
  autoload :Engine, 'wingman/engine'
  autoload :Config, 'wingman/config'

  module Stats
    autoload :Stat, 'wingman/stats/stat'
    autoload :JavascriptEnabled, 'wingman/stats/javascript_enabled'
    autoload :UserAgent, 'wingman/stats/user_agent'
  end

  class << self
    def configure
      yield self
    end
  end

  include Config
end

require 'wingman/engine' if defined?(Rails)
