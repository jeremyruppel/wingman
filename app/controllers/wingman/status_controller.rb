module Wingman
  class StatusController < ActionController::Base

    respond_to :json, :only => :status

    def status
      # TODO optimize, this is running the tests twice
      # but I like beer a lot more than optimizing right now
      render :json => {
        :kosher       => Wingman.tests.map( &:block ).all?( &:call ),
        :current_time => Time.now.utc.to_s,
        :stats        => Wingman.stats.map( &:resolve ),
        :tests        => Wingman.tests.map( &:resolve )
      }
    end

    def index
    end
  end
end
