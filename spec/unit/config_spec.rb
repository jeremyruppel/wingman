require 'spec_helper'

describe Wingman do

  context '#configure' do

    it { should respond_to( :configure ) }

    it 'should yield itself to the configure block' do
      Wingman.configure do |config|
        config.should eq( Wingman )
      end
    end
  end
end
