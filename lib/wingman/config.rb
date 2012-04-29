module Wingman
  module Config
    extend ActiveSupport::Concern

    included do
      Dir[ File.join( File.dirname( __FILE__ ), 'stats/*.rb' ) ].each { |f| require f }
    end

    module ClassMethods

      @@stats = { }
      mattr_accessor :stats

      def stat( name, &block )
        stat = Stat.new(name)
        stat.instance_eval &block
        stats[ name ] = stat
      end
    end
  end
end
