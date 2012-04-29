require 'spec_helper'

describe Wingman.stats[ :javascript_enabled ] do

  its( :name  ){ should eq( :javascript_enabled ) }
  its( :value ){ should eq( 'Not enabled' ) }
  its( :title ){ should eq( 'Javascript Enabled' ) }

  its( :render ){ should eq( <<-EOS
<script type='text/javascript'>
$( function( ){ $( 'input#feedback_javascript_enabled' ).val( 'Enabled' ); } );
</script>
  EOS
  ) }
end
