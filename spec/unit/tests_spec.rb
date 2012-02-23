require 'spec_helper'

describe Wingman do

  it { should respond_to( :test ) }

  it { should respond_to( :tests ) }
  its( :tests ){ should be_kind_of( Array ) }

  context '#test' do

    it 'should add a new test to the test array' do
      Wingman.configure do |config|
        config.test :foo do
          'bar'
        end
      end

      Wingman.tests.should have( 1 ).item
    end
  end
end
