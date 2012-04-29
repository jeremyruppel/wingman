require 'spec_helper'

describe Wingman.stats[ :user_agent ] do

  its( :name  ){ should eq( :user_agent ) }
  its( :value ){ should eq( 'Not detected' ) }
  its( :title ){ should eq( 'User Agent' ) }

  its( :render ){ should eq( <<-EOS
<script type='text/javascript'>
$( function( ){ $( 'input#user_agent' ).val( navigator.userAgent ); } );
</script>
  EOS
  ) }
end
