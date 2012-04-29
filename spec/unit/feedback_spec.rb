require 'spec_helper'

describe Wingman::Feedback do

  it { should validate_presence_of( :email ) }
  it { should validate_presence_of( :comment ) }
end
