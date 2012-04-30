require 'wingman/version'

module Wingman
  autoload :Engine,   'wingman/engine'
  autoload :Config,   'wingman/config'
  autoload :Stat,     'wingman/stat'
  autoload :Feedback, 'wingman/feedback'
  autoload :Railsy,   'wingman/railsy'

  class << self
    def configure
      yield self
    end
  end

  include Config
  include Railsy
end

require 'wingman/engine' if defined?(Rails)
