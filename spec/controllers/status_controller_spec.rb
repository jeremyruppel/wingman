require 'spec_helper'

describe Wingman::StatusController do

  # any better suggestions?
  # http://stackoverflow.com/questions/7691594/how-to-test-routes-in-a-rails-3-1-mountable-engine
  before :each do
    @routes = Wingman::Engine.routes
  end

  it { should route( :get, '/' ).to( :action => :index ) }
end
