module Wingman

  Test = Struct.new :name, :block do
    def resolve
      { name => block.call }
    end
  end

  module Tests
    extend ActiveSupport::Concern

    included do
      resets << lambda { @tests = [ ] }
    end

    module ClassMethods

      def tests
        @tests ||= [ ]
      end

      def test( name, &block )
        tests << Test.new( name, block )
      end
    end
  end
end
