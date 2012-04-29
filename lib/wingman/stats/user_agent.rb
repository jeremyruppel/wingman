module Wingman
  module Stats
    class UserAgent

      def name
        self.class.to_s.demodulize.underscore.to_sym
      end

      def value
        'Not detected'
      end

      def title
        self.class.to_s.demodulize.titleize
      end
    end
  end
end
