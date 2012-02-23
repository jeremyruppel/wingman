require 'spec_helper'

describe Wingman do

  it { should respond_to( :stat ) }

  it { should respond_to( :stats ) }
  its( :stats ){ should be_kind_of( Array ) }

  context '#stat' do

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
