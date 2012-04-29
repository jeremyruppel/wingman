require 'spec_helper'

describe Wingman.stats[ :access_time ] do

  its( :name  ){ should eq( :access_time ) }
  its( :value ){ should eq( 'Not detected' ) }
  its( :title ){ should eq( 'Access Time' ) }

  its( :render ){ should eq( <<-EOS
<script type='text/javascript'>
$( function( ){ $( 'input#feedback_access_time' ).val( new Date( ).toLocaleString( ) ); } );
</script>
  EOS
  ) }
end
