require 'spec_helper'

describe Wingman do

  context '#configure' do

    it { should respond_to( :configure ) }

    it 'should yield itself to the configure block' do
      Wingman.configure do |config|
        config.should eq( Wingman )
      end
    end

    describe '#test' do

      it { should respond_to( :test ) }

      describe 'the test array' do
        subject { Wingman.tests }

        it { should be_kind_of( Array ) }
      end

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
end