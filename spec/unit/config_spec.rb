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
  end
end