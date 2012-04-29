module Wingman
  module Stats
    class JavascriptEnabled < Stat

      def value
        'Not enabled'
      end

      def render
        script = <<-EOS
$( function( ){ $( 'input##{name}' ).val( 'Enabled' ) } );
        EOS
      end
    end
  end
end
