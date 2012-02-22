require 'spec_helper'

describe Wingman::StatusController do

  # any better suggestions?
  # http://stackoverflow.com/questions/7691594/how-to-test-routes-in-a-rails-3-1-mountable-engine
  before :each do
    @routes = Wingman::Engine.routes
  end

  context 'GET index' do

    it { should route( :get, '/' ).to( :action => :index ) }

    before do
      get :index
    end

    it { should respond_with( :success ) }
    it { should respond_with_content_type( :html ) }
    it { should render_template( :index ) }
  end

  context 'GET status' do

    it { should route( :get, '/status.json' ).to( :action => :status, :format => :json ) }

    before do
      get :status, :format => :json
    end

    it { should respond_with( :success ) }
    it { should respond_with_content_type( :json ) }
  end
end
