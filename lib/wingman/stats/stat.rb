module Wingman
  module Stats
    class Stat

      def name
        self.class.to_s.demodulize.underscore.to_sym
      end

      def title
        self.class.to_s.demodulize.titleize
      end
    end
  end
end
