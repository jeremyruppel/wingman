require 'spec_helper'

describe Wingman::Stat do
  subject { Wingman::Stat.new :foo_bar }

  before do
    subject.initial_value 'Not foo bar'
    subject.replace_value 'Definitely foo bar'
  end

  its( :name   ){ should eq( :foo_bar  ) }
  its( :title  ){ should eq( 'Foo Bar' ) }
  its( :value  ){ should eq( 'Not foo bar' ) }
  its( :render ){ should eq( <<-EOS
<script type='text/javascript'>
$( function( ){ $( 'input#foo_bar' ).val( 'Definitely foo bar' ); } );
</script>
  EOS
  ) }
end
