require 'spec_helper'

describe Wingman do
  subject { Wingman }

  its( :stats ){ should include( Wingman::Stats::JavascriptEnabled ) }
  its( :stats ){ should include( Wingman::Stats::UserAgent ) }
end
