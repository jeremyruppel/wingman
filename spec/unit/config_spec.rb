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

  context '#stats' do
    its( :stats ){ should be_a( Hash ) }
    its( :stats ){ should include( :javascript_enabled ) }
    its( :stats ){ should include( :user_agent ) }
  end

  context '#stat' do
    it 'should add a new stat' do
      Wingman.stat :foo_bar do
      end
      Wingman.stats.should include( :foo_bar )
    end
  end
end
