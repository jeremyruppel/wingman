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

    context 'the response body' do
      subject { the_response_body }

      it { should eq(

        {
          :kosher       => true,
          :current_time => Time.now.utc.to_s,
          :tests        => [ ],
          :stats        => [ ]
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

    subject { the_response_body }

    it { should eq(

      {
        :kosher       => true,
        :current_time => Time.now.utc.to_s,
        :stats        => [ ],
        :tests        =>
        [
          :foo => 'bar'
        ]
      }

    ) }
  end

  context 'GET status with stats' do

    before do
      Wingman.configure do |config|
        config.stat :foo do
          'bar'
        end
      end

      get :status, :format => :json
    end

    subject { the_response_body }

    it { should eq(

      {
        :kosher       => true,
        :current_time => Time.now.utc.to_s,
        :tests        => [ ],
        :stats        =>
        [
          :foo => 'bar'
        ]
      }

    ) }
  end

  context 'GET status with passing tests' do

    before do
      Wingman.configure do |config|
        config.test :foo do
          true
        end
        config.test :bar do
          true
        end
      end

      get :status, :format => :json
    end

    subject { the_response_body }

    it { should eq(

      {
        :kosher       => true,
        :current_time => Time.now.utc.to_s,
        :stats        => [ ],
        :tests        =>
        [
          {
            :foo => true
          },
          {
            :bar => true
          }
        ]
      }

    ) }
  end

  context 'GET status with failing tests' do

    before do
      Wingman.configure do |config|
        config.test :foo do
          true
        end
        config.test :bar do
          false
        end
      end

      get :status, :format => :json
    end

    subject { the_response_body }

    it { should eq(

      {
        :kosher       => false,
        :current_time => Time.now.utc.to_s,
        :stats        => [ ],
        :tests        =>
        [
          {
            :foo => true
          },
          {
            :bar => false
          }
        ]
      }

    ) }
  end
end
