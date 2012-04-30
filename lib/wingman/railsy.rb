module Wingman
  module Railsy
    extend ActiveSupport::Concern

    module ClassMethods

      def application_name
        # TODO store
        ::Rails.application.class.name.split( '::' ).first
      end
    end
  end
end
