require 'spec_helper'

describe Wingman::FeedbackController do
  render_views

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
    it { should render_with_layout( :wingman ) }
  end

  context 'POST create' do

    it { should route( :post, '/' ).to( :action => :create ) }

    context 'with a valid email and comment' do
      before do
        post :create, :feedback => { :email => 'foo@bar.com', :comment => 'Ur sites borked d00d' }
      end

      it { should redirect_to( root_path ) }
      it { should set_the_flash.to( 'Thanks for your feedback!' ) }
    end

    context 'without a valid email' do
      before do
        post :create, :feedback => { :comment => 'Ur sites borked d00d' }
      end

      it { should redirect_to( root_path ) }
      it { should set_the_flash.to( 'Oops! Error message here!' ) }
    end

    context 'without a valid comment' do
      before do
        post :create, :feedback => { :email => 'foo@bar.com' }
      end

      it { should redirect_to( root_path ) }
      it { should set_the_flash.to( 'Oops! Error message here!' ) }
    end

    context 'with stat keys' do
      before do
        post :create, :feedback => { :email => 'foo@bar.com', :comment => 'Ur sites borked d00d', :javascript_enabled => false }
      end

      it { should redirect_to( root_path ) }
      it { should set_the_flash.to( 'Thanks for your feedback!' ) }
    end
  end
end
