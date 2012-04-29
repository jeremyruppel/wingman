module Wingman
  module Stats
    class UserAgent < Stat

      def value
        'Not detected'
      end

      def render
        script = <<-EOS
$( function( ){ $( 'input##{name}' ).val( navigator.userAgent ) } );
        EOS
      end
    end
  end
end
