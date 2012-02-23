module Wingman

  Stat = Struct.new :name, :block do
    def resolve
      { name => block.call }
    end
  end

  module Stats
    extend ActiveSupport::Concern

    included do
      resets << lambda { @stats = [ ] }
    end

    module ClassMethods

      def stats
        @stats ||= [ ]
      end

      def stat( name, &block )
        stats << Stat.new( name, block )
      end
    end
  end
end
