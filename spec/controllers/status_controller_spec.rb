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

    describe 'the response body' do
      subject { JSON.parse response.body, :symbolize_names => true }

      it { should eq(

        {
          :current_time => Time.now.utc.to_s,
          :tests        => [ ]
        }

      ) }
    end
  end

  context 'GET status with tests' do

    before do
      Wingman.configure do |config|
        config.test :foo do
          'bar'
        end
      end

      get :status, :format => :json
    end

    subject { JSON.parse response.body, :symbolize_names => true }

    it { should eq(

      {
        :current_time => Time.now.utc.to_s,
        :tests        =>
        [
          :foo => 'bar'
        ]
      }

    ) }
  end
end
