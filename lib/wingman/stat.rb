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
$( function( ){ $( 'input##{name}' ).val( #{@replace_value} ); } );
EOS
    end
  end
end
