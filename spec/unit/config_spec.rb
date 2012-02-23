require 'spec_helper'

describe Wingman do

  context '#configure' do

    it { should respond_to( :configure ) }

    it 'should yield itself to the configure block' do
      Wingman.configure do |config|
        config.should eq( Wingman )
      end
    end

    context '#resets' do
      subject { Wingman.resets }

      it { should be_kind_of( Array ) }
    end

    it { should respond_to( :reset! ) }

    context '#test' do

      it { should respond_to( :test ) }

      context 'the test array' do
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

    context '#stat' do

      it { should respond_to( :stat ) }

      context 'the stat array' do
        subject { Wingman.stats }

        it { should be_kind_of( Array ) }
      end

      it 'should add a new stat to the stat array' do
        Wingman.configure do |config|
          config.stat :foo do
            'bar'
          end
        end

        Wingman.stats.should have( 1 ).item
      end
    end
  end
end