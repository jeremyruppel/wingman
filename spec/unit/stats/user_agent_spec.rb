require 'spec_helper'

describe Wingman::Stats::UserAgent do

  its( :name  ){ should eq( :user_agent ) }
  its( :value ){ should eq( 'Not detected' ) }
  its( :title ){ should eq( 'User Agent' ) }
end
