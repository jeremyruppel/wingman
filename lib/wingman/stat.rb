module Wingman
  class Stat < Struct.new( :name )
    def title
      name.to_s.titleize
    end

    def initial_value( value )
      @initial_value = value
    end
    def replace_value( value )
      @replace_value = begin
        case value
        when String
          "'#{value}'"
        when Symbol
          value.to_s
        end
      end
    end

    def value
      @initial_value
    end

    def render
      script = <<-EOS
<script type='text/javascript'>
$( function( ){ $( 'input#feedback_#{name}' ).val( #{@replace_value} ); } );
</script>
EOS
      script.html_safe
    end
  end
end
