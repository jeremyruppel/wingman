require 'spec_helper'

describe Wingman::Stats::JavascriptEnabled do

  its( :name  ){ should eq( :javascript_enabled ) }
  its( :value ){ should eq( 'Not enabled' ) }
  its( :title ){ should eq( 'Javascript Enabled' ) }

  its( :render ){ should eq( <<-EOS
$( function( ){ $( 'input#javascript_enabled' ).val( 'Enabled' ) } );
  EOS
  ) }
end
