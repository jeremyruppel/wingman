module Wingman
  module Stats
    extend ActiveSupport::Concern

    module ClassMethods

      # TODO ugh, don't want to list these out.
      # there has to be a better way to do this,
      # but i'd rather drink this wine than worry
      # about it too much
      def stats
        @stats ||= begin
          [ ].tap do |s|
            s << JavascriptEnabled
            s << UserAgent
          end
        end
      end
    end
  end
end
