module Wingman

  Test = Struct.new :name, :block

  module Tests
    extend ActiveSupport::Concern

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
